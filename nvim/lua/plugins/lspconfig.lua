return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/schemastore.nvim",
  },
  config = function()
    -- vim.lsp.inline_completion.enable(true)
    -- vim.lsp.document_color.enable(true, 0, { style = "virtual" })
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }

    local lsps = {
      "bashls",
      "biome",
      "cmake",
      "clangd",
      "cssls",
      "dartls",
      "denols",
      "bashls",
      "docker_compose_language_service",
      "gopls",
      "html",
      "jsonls",
      "pyright",
      "rust_analyzer",
      "sourcekit",
      "sqls",
      "svelte",
      "tailwindcss",
      "ts_ls",
      "zls",
      -- "copilot",
      --"pylsp",
    }
    for _, lsp in pairs(lsps) do
      vim.lsp.enable(lsp)
    end
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
    vim.lsp.config("biome", {
      capabilities = capabilities,
      cmd = { "bunx", "biome", "lsp-proxy" },
    })
    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
      },
    })
    vim.lsp.config("rust_analyzer", {
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
          check = {
            command = "clippy",
          },
        },
      },
    })

    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
            }
          },
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
  end,
}
