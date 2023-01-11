return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    require "mason"
    require("plugins.lsp.diagnostics").setup()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.offsetEncoding = { "utf-16" }
    local mason = require "mason-lspconfig"
    mason.setup {
      automatic_installation = false,
    }
    local servers = {
      clangd = {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--cross-file-rename",
        },
      },
      rust_analyzer = {
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
      jsonls = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
      sumneko_lua = {
        Lua = {
          format = { enable = false },
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
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
    mason.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          on_attach = function(client, bufnr)
            require("plugins.lsp.keys").keys(client, bufnr)
          end,
          capabilities = capabilities,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
