return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local b = require("null-ls").builtins
    require("null-ls").setup {
      sources = {
        --スペルチェック
        b.diagnostics.codespell,
        --python3
        b.diagnostics.ruff.with {
          condition = function(dir)
            return dir.has_file { "ruff.toml", ".ruff.toml" }
          end
        },
        b.diagnostics.mypy,
        b.diagnostics.pylint,
        -- javascript
        b.diagnostics.eslint.with {
          condition = function(dir)
            return dir.has_file { ".eslintrc", ".eslintrc.cjs", ".eslintrc.js" }
          end,
        },
      },
      --CMake
      -- b.diagnostics.cmake_lint,
      -- b.diagnostics.checkmake,
      -- markdown
      b.formatting.markdownlint,
      --CSS
      b.formatting.stylelint,
      --pug
      b.diagnostics.puglint,
      -- shell
      b.diagnostics.shellcheck,
      b.formatting.shfmt,
      --envを表示
      --b.hover.printenv,
    }
  end,
}
