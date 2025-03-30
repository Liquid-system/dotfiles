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
    local lsps = {
      "cmake",
      "pylsp",
      "gopls",
      "svelte",
      "html",
      "cssls",
      "sqls",
      "bashls",
      "zls",
      "dartls",
      "denols",
      "docker_compose_language_service",
    }
    for _, lsp in pairs(lsps) do
      lspconfig[lsp].setup({ capabilities = capabilities })
    end

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
    lspconfig.ts_ls.setup({
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
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })
  end,
}
