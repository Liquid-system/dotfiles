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
    format_on_save = {},
    format_after_save = {},
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "autoflake", "black", "ruff_format", stop_after_first = true },
      javascript = { "biome-check", "prettier", "deno_fmt", stop_after_first = true },
      c = { "clang_format" },
      cpp = { "clang_format" },
      cmake = { "cmake_format" },
      rust = { "rustfmt" },
      go = { "gofmt", "goimports" },
      swift = { "swift_format" },
      sql = { "sql_formatter" },
      zig = { "zigfmt" },
      json = { "jq", "jsonnetfmt", stop_after_first = true },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      ["_"] = { "trim_whitespace", "trim_newlines" },
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
