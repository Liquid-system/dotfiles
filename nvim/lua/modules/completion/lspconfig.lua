-- See `:help vim.lsp.*` for documentation on any of the below functions
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
	virtual_text = false,
	signs = {
		active = signs, -- show signs
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	focusable = false,
	relative = "cursor",
})

local on_attach = require("core.keymap").on_attach

require("mason").setup()
local mason = require "mason-lspconfig"
local lspconfig = require "lspconfig"

mason.setup {
	automatic_installation = true,
}

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
				"--background-index",
				"--clang-tidy",
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
