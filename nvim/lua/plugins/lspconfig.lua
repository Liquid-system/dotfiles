-- See `:help vim.lsp.*` for documentation on any of the below functions
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')
local keymap = vim.keymap.set

-- See `:help vim.lsp.*` for documentation on any of the below functions
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

local servers = { "clangd", "pylsp", "rust_analyzer", "cmake", "cssls", "eslint", "gopls", "graphql", "html",
	"jsonls", "zls", "dockerls", "eslint" }

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		on_attach = require('core.mappings').on_attach,
		capabilities = capabilities,
	}
end
--nodeとdenoのコンフリクトの解決
lspconfig.tsserver.setup {
	on_attach = require('core.mappings').on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json")
}

--lspconfig.denols.setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--    -- Omitting some options
--    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--}

local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = require('core.mappings').on_attach,
		capabilities = capabilities,
		cmd = { "lua-language-server" }
	},
})
lspconfig.sumneko_lua.setup(luadev)
