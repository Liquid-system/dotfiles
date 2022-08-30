-- 1. LSP Sever management
require('mason').setup()
local keymap = vim.keymap.set
-- See `:help vim.lsp.*` for documentation on any of the below functions
local function on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
	keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
	keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
	keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	keymap('n', 'gr', vim.lsp.buf.references, bufopts)
	keymap('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	--saga
	local saga = require('lspsaga')
	saga.init_lsp_saga()
	-- Lsp finder find the symbol definition implement reference
	-- when you use action in finder like open vsplit then you can
	-- use <C-t> to jump back
	keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
	keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
	keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
	keymap("n", "gp", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
	keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
	keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
	-- Diagnsotic jump can use `<c-o>` to jump back
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
	-- Only jump to error
	keymap("n", "[E", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })
	keymap("n", "]E", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })
	keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

for _, server in ipairs { "clangd", "pylsp", "rust_analyzer", "cmake", "cssls", "eslint", "gopls", "graphql", "html",
	"jsonls", "zls", "dockerls", "eslint" } do
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
