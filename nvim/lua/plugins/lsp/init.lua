local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"b0o/schemastore.nvim"
	},
}
function M.config()
	require("mason").setup()
	local mason = require "mason-lspconfig"
	local lspconfig = require "lspconfig"

	mason.setup {
		automatic_installation = true,
	}

	local function on_attach(client, bufnr)
		require("plugins.lsp.keys").setup(client, bufnr)
	end

	mason.setup_handlers {
		function(server)
			local opts = {}
			opts.on_attach = on_attach
			opts.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
			opts.capabilities.offsetEncoding = { "utf-16" }
			if server == "clangd" then
				opts.cmd = {
					"clangd",
					"--clang-tidy",
					"--cross-file-rename",
				}
			elseif server == "rust_analyzer" then
				opts.settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				}
			elseif server == "jsonls" then
				opts.settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				}
			elseif server == "sumneko_lua" then
				opts.settings = {
					Lua = {
						format = { enable = false },
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				}
			end
			lspconfig[server].setup(opts)
		end,
	}
end

return M
