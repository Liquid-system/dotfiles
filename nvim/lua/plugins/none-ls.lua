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
        -- Lua
        b.formatting.stylua,
        --python3
        b.formatting.isort,
        b.formatting.black,
        b.diagnostics.mypy,
        b.diagnostics.pylint,
        --clang
        b.formatting.clang_format,
        --b.formatting.uncrustify,
        --rust
        b.formatting.rustfmt,
        -- javascript
        b.diagnostics.eslint.with {
          condition = function(dir)
            return dir.has_file { ".eslintrc", ".eslintrc.cjs", ".eslintrc.js" }
          end,
        },
        b.formatting.biome.with {
          prefer_local = "node_modules/.bin",
          condition = function(dir)
            return dir.has_file { "biome.json" }
          end,
        },
        b.formatting.deno_fmt.with {
          condition = function(dir)
            return dir.has_file { "deno.json", "deno.jsonc" }
          end,
        },
        b.formatting.prettier.with {
          condition = function(dir)
            return dir.has_file { ".prettierrc", ".prettierrc.js" }
          end,
          prefer_local = "node_modules/.bin",
        },
      },
      --CMake
      -- b.diagnostics.cmake_lint,
      -- b.diagnostics.checkmake,
      b.formatting.cmake_format,
      -- markdown
      b.formatting.markdownlint,
      -- go
      b.formatting.goimports,
      b.formatting.gofmt,
      --yaml
      b.formatting.yamlfmt,
      --CSS
      b.formatting.stylelint,
      --pug
      b.diagnostics.puglint,
      --sql
      b.formatting.sql_formatter,
      --json
      b.formatting.jq,
      --toml
      b.formatting.taplo,
      -- shell
      b.diagnostics.shellcheck,
      b.formatting.shfmt,
      --envを表示
      --b.hover.printenv,
      -- zig
      b.formatting.zigfmt,
    }
  end,
}
