-- See `:help vim.lsp.*` for documentation on any of the below functions

local lspconfig = require('lspconfig')


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = require('core.mappings').on_attach

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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
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
	Info = " "
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local servers = {
	"clangd",
	"pylsp",
	"rust_analyzer",
	"cmake",
	"cssls",
	--"eslint",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"zls",
	"dockerls",
}

for _, server in ipairs(servers) do
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
	on_attach = require('core.mappings').on_attach,
	capabilities = capabilities,
	cmd = { "lua-language-server" }
},
})
lspconfig.sumneko_lua.setup(luadev)
