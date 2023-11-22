return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
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
    
    require("mason-lspconfig").setup {
      automatic_installation = false,
    }
    require("plugins.lsp.diagnostics").setup()

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ["clangd"] = function()
        require("lspconfig")["clangd"].setup {
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
        }
      end,
      ["denols"] = function()
        require("lspconfig")["denols"].setup {
          capabilities = capabilities,
          root_dir = require("lspconfig").util.root_pattern "deno.json",
          init_options = {
            lint = true,
            unstable = true,
            suggest = {
              imports = {
                hosts = {
                  ["https://deno.land"] = true,
                  ["https://cdn.nest.land"] = true,
                  ["https://crux.land"] = true,
                },
              },
            },
          },
        }
      end,
      ["tsserver"] = function()
        require("lspconfig")["tsserver"].setup {
          capabilities = capabilities,
          single_file_support = false,
          root_dir = require("lspconfig").util.root_pattern "package.json",
        }
      end,
      ["rust_analyzer"] = function()
        require("lspconfig")["rust_analyzer"].setup {
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
        if not status then
          return
        end
        require("lspconfig")["jsonls"].setup {
          capabilities = capabilities,
          settings = {
            json = {
              schemas = schemastore.json.schemas(),
              validate = { enable = true },
            },
          },
        }
      end,
      ["lua_ls"] = function()
        require("lspconfig")["lua_ls"].setup {
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
