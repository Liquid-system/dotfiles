local config = {}
function config.cmp()
    local present, cmp = pcall(require, "cmp")
    if not present then
        return
    end
    local function border(hl_name)
        return {
            { "╭", hl_name },
            { "─", hl_name },
            { "╮", hl_name },
            { "│", hl_name },
            { "╯", hl_name },
            { "─", hl_name },
            { "╰", hl_name },
            { "│", hl_name },
        }
    end

    local cmp_window = require("cmp.utils.window")
    cmp_window.info_ = cmp_window.info
    cmp_window.info = function(self)
        local info = self:info_()
        info.scrollable = false
        return info
    end

    local options = {
        window = {
            completion = {
                border = border("CmpBorder"),
                winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = border("CmpDocBorder"),
            },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        formatting = {
            format = function(_, vim_item)
                local icons = require("nvchad_ui.icons").lspkind
                vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
                return vim_item
            end,
        },
        mapping = {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                    )
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "nvim_lsp_signature_help" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "path" },
        },
    }
    cmp.setup(options)
    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "path" },
        },
        {
            { name = "cmdline" },
        },
    })
end

function config.lspconfig()
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }
    --capabilities.textDocument.completion.completionItem.snippetSupport = true
    local on_attach = require("keymap").on_attach

    capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        },
    }
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
        focusable = false,
        relative = "cursor",
    })

    local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local servers = {
        --C++
        "clangd",
        "cmake",
        --python3
        -- "pyright",
        --"pyre",
        "pylsp",
        --CSS
        "cssls",
        --"eslint",
        "gopls",
        "graphql",
        "html",
        -- zig
        "zls",
        -- toml
        "taplo",
        -- bash
        "bashls",
        "dockerls",
        "vimls",
    }
    local lspconfig = require("lspconfig")
    for _, server in ipairs(servers) do
        lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end

    lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    })

    --nodeとdenoのコンフリクトの解決
    lspconfig.tsserver.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            on_attach()
        end,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package.json"),
    })

    --lspconfig.denols.setup {
    --    on_attach = on_attach,
    --    capabilities = capabilities,
    --    -- Omitting some options
    --    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    --}
    lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    })
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    lspconfig.sumneko_lua.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                format = { false },
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    })
end

function config.null_ls()
    local present, null_ls = pcall(require, "null-ls")

    if not present then
        return
    end

    local b = null_ls.builtins

    local sources = {
        -- Lua
        b.formatting.stylua,
        --python3
        b.formatting.isort,
        b.formatting.black,
        b.diagnostics.mypy,
        b.diagnostics.pylint,
        --clang
        b.formatting.clang_format,
        --rust
        b.formatting.rustfmt,
        --CMake
        --b.diagnostics.cmake_lint,
        b.diagnostics.checkmake,
        b.formatting.cmake_format,
        -- markdown
        b.formatting.markdownlint,
        b.formatting.markdown_toc,
        -- go
        b.formatting.goimports,
        --javascript
        b.diagnostics.eslint,
        b.code_actions.eslint,
        --yaml
        b.formatting.yamlfmt,
        --CSS
        b.formatting.stylelint,
        --Prettier
        b.formatting.prettier,
        --pug
        b.diagnostics.puglint,
        --sql
        b.formatting.sql_formatter,
        --json
        b.formatting.jq,
        -- shell
        b.diagnostics.shellcheck,
        b.formatting.shfmt,
        --envを表示
        b.hover.printenv,
    }
    null_ls.setup({
        debug = true,
        sources = sources,
        on_attach = require("keymap").on_attach,
    })
end

function config.saga()
    local saga = require("lspsaga")
    saga.init_lsp_saga({
        code_action_lightbulb = { enable = false },
    })
end

function config.mason()
    require("mason").setup()
    require("mason-lspconfig").setup({
        automatic_installation = true,
    })
end

return config
