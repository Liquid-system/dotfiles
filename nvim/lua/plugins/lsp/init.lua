return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.offsetEncoding = { "utf-16" }

    require("plugins.lsp.diagnostics").setup()
    require("mason-lspconfig").setup {
      automatic_installation = false,
    }

    local keys = function(client, bufnr)
      require("plugins.lsp.keys").keys(client, bufnr)
    end

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          on_attach = keys,
          capabilities = capabilities,
        }
      end,
      ["clangd"] = function()
        require("lspconfig").clangd.setup {
          on_attach = keys,
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--clang-tidy",
            "--cross-file-rename",
          },
        }
      end,
      ["rust_analyzer"] = function()
        require("lspconfig").rust_analyzer.setup {
          on_attach = keys,
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
        }
      end,
      ["jsonls"] = function()
        local status, schemastore = pcall(require, "schemastore")
        if (not status) then return end
        require("lspconfig").jsonls.setup {
          on_attach = keys,
          capabilities = capabilities,
          settings = {
            json = {
              schemas = schemastore.json.schemas(),
              validate = { enable = true },
            },
          },
        }
      end,
      ["sumneko_lua"] = function()
        require("neodev")
        require("lspconfig").sumneko_lua.setup {
          on_attach = keys,
          capabilities = capabilities,
          settings = {
            Lua = {
              format = { enable = false },
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        }
      end,
    }
  end,
}
