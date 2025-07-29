return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }
    local lsps = {
      --"denols",
      --"pylsp",
      "bashls",
      "biome",
      "clangd",
      "cmake",
      "cssls",
      "dartls",
      "docker_compose_language_service",
      "gopls",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "sqls",
      "svelte",
      "tailwindcss",
      "ts_ls",
      "zls",
    }
    for _, lsp in pairs(lsps) do
      vim.lsp.enable(lsp, {
        capabilities = capabilities,
      })
    end
    vim.lsp.config(
      "biome", {
        capabilities = capabilities,
        cmd = { "bunx", "biome", "lsp-proxy" },
      }
    )
    vim.lsp.config("clangd", {
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
    )
    vim.lsp.config(
      "rust_analyzer", {
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
      }
    )

    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
}
