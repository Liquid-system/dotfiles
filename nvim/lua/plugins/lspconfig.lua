return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = {
        "markdown",
        "plaintext",
      },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = {
        valueSet = { 1 },
      },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }
    local lspconfig = require("lspconfig")
    lspconfig.cmake.setup({ capabilities = capabilities })
    lspconfig.pylsp.setup({ capabilities = capabilities })
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.svelte.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.sqls.setup({ capabilities = capabilities })
    lspconfig.bashls.setup({ capabilities = capabilities })
    lspconfig.zls.setup({ capabilities = capabilities })
    lspconfig.denols.setup({ capabilities = capabilities })
    lspconfig.biome.setup({
      capabilities = capabilities,
      cmd = { "bunx", "biome", "lsp-proxy" },
    })
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
        "--clang-tidy",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
      },
    })
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      single_file_support = false,
    })
    lspconfig.rust_analyzer.setup({
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
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
          client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
            },
          })
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end,
    })
  end,
}
