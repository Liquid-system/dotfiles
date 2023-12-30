return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", { "black", "ruff_format" } },
      javascript = { { "biome", "prettier", "deno_fmt" } },
      c = { "clang_format" },
      cpp = { "clang_format" },
      cmake = { "cmake_format" },
      rust = { "rustfmt" },
      go = { "gofmt", "goimports" },
      sql = { "sql_formatter" },
      zig = { "zigfmt" },
      json = { "jq" },
      yaml = { "yamlfmt" },
      toml = { "taplo" }
    },
    formatters = {
      deno_fmt = {
        cwd = function()
          require("conform.util").root_file({ "deno.json" })
        end,
      },
    },
  },
}
