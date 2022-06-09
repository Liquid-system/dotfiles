--nodeとdenoのコンフリクトの解決
local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup {}
nvim_lsp.tsserver.setup {
	-- Omitting some options
	root_dir = nvim_lsp.util.root_pattern("package.json")
}
nvim_lsp.denols.setup {
	-- Omitting some options
	root_dir = nvim_lsp.util.root_pattern("deno.json"),
}

--lua
require 'lspconfig'.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
require"lspconfig".pylsp.setup {
	filetypes = {"python"},
	settings = {
	configurationSources = {"flake8"},
	formatCommand = {"black"}
	}
}
