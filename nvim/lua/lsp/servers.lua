--nodeとdenoのコンフリクトの解決
local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup{}
nvim_lsp.tsserver.setup{
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("package.json")
}
nvim_lsp.denols.setup {
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
}