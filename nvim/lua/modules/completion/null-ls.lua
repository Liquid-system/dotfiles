local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,
  --python3
  b.formatting.isort,
  b.formatting.black,
  b.diagnostics.mypy,
  b.diagnostics.pylint,
  --clang
  b.formatting.clang_format,
  --rust
  b.formatting.rustfmt,
  --CMake
  --b.diagnostics.cmake_lint,
  b.diagnostics.checkmake,
  b.formatting.cmake_format,
  -- markdown
  b.formatting.markdownlint,
  b.formatting.markdown_toc,
  -- go
  b.formatting.goimports,
  --javascript
  b.diagnostics.eslint,
  b.code_actions.eslint,
  --yaml
  b.formatting.yamlfmt,
  --CSS
  b.formatting.stylelint,
  --Prettier
  b.formatting.prettier,
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
  -- editorconfig
  --b.diagnostics.editorconfig_checker,
  --envを表示
  b.hover.printenv,
}
null_ls.setup({
  sources = sources,
})
