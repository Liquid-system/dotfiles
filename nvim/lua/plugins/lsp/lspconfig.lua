-- See `:help vim.lsp.*` for documentation on any of the below functions
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" }
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = require("core.mappings").on_attach

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
	focusable = false,
	relative = "cursor",
})

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

local servers = {
	--C++
	"clangd",
	"cmake",
	--python3
	--"pyright",
	"pyre",
	"pylsp",
	-- Rust
	"rust_analyzer",
	--CSS
	"cssls",
	--"eslint",
	"gopls",
	"graphql",
	"html",
	-- zig
	"zls",
	"dockerls",
	"vimls",
}
local lspconfig = require("lspconfig")

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

--nodeとdenoのコンフリクトの解決
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json"),
})

--lspconfig.denols.setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--    -- Omitting some options
--    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--}
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup({
	on_attach = require("core.mappings").on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			format = { false },
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
