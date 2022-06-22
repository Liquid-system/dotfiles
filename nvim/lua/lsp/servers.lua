require("nvim-lsp-installer").setup {}
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
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
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
--nodeとdenoのコンフリクトの解決
lspconfig.denols.setup {}
lspconfig.tsserver.setup {
	-- Omitting some options
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json")
}
lspconfig.denols.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	-- Omitting some options
	root_dir = lspconfig.util.root_pattern("deno.json"),
}
lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
--lua
lspconfig.sumneko_lua.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			format = {
				enable = true
			},
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'Lua5.4', 'LuaJIT',
				path = {
					vim.split(package.path, ';'),
					'?.lua',
					'?/init.lua',
					vim.fn.expand '~/.luarocks/lua_modules/share/lua/5.4/?.lua',
					vim.fn.expand '~/.luarocks/lua_modules/share/lua/5.4/?/init.lua',
					'/usr/local/share/lua/5.4/?.lua',
					'/usr/local/share/lua/5.4?/.lua'
				},
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			workspace = {
				library = {
					vim.api.nvim_get_runtime_file("", true),
					vim.fn.expand '~/.luarocks/lua_modules/share/lua/5.4',
					'/usr/local/share/lua/5.4/'
				},
			},
		},
	},
}
