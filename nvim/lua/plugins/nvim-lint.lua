return {
  "mfussenegger/nvim-lint",
  event = "LspAttach",
  config = function()
    require("lint").linters_by_ft = {
      ["*"] = { "codespell" },
      c = { "clangtidy" },
      python = { "ruff", "mypy", "pylint" },
      javascript = { "eslint" },
      css = { "stylelint" },
      cmake = { "cmakelint" },
      markdown = { "markdownlint" },
      sh = { "shellcheck" },
      zsh = { "zsh" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
