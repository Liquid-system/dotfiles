-- 1. LSP Sever management
require('mason').setup()
local function on_attach(client, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc,
		{ silent = true }, bufopts)
	local action = require("lspsaga.action")
	-- scroll down hover doc or scroll in definition preview
	vim.keymap.set("n", "<C-f>", function()
		action.smart_scroll_with_saga(1)
	end, { silent = true })
	-- scroll up hover doc
	vim.keymap.set("n", "<C-b>", function()
		action.smart_scroll_with_saga(-1)
	end, { silent = true })
	vim.keymap.set('n', '<C-k>', require("lspsaga.signaturehelp").signature_help,
		{ silent = true, noremap = true }, bufopts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

for _, server in ipairs { "clangd", "pylsp", "rust_analyzer", "cmake", "cssls", "eslint", "gopls", "graphql", "html",
	"jsonls", "zls" } do
	lspconfig[server].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
--nodeとdenoのコンフリクトの解決
lspconfig.tsserver.setup {
	on_attach = on_attach,
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
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "lua-language-server" }
	},
})
lspconfig.sumneko_lua.setup(luadev)
