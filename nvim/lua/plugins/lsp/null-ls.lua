local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Lua
  -- b.formatting.stylua,
  --python3
  b.formatting.isort,
  b.formatting.black,
  --clang
  b.diagnostics.clang_check,
  --CMake
  --b.diagnostics.cmake_lint,
  b.formatting.cmake_format,
  -- markdown
  b.formatting.markdownlint,
  -- go
  b.formatting.goimports,
  --javascript
  --b.diagnostics.eslint,
  --b.code_actions.eslint,
  --yaml
  b.formatting.yamlfmt,
  --CSS
  b.formatting.stylelint,
  --Prettier
  --b.formatting.prettier,
  --sql
  b.formatting.sql_formatter
}
--
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = require('core.mappings').on_attach,
}
