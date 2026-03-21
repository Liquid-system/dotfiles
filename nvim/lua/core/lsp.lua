vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = {
		prefix = "󰐂 ",
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	signs = {
		text = { "", "", "", "" },
		numhl = {
			"DiagnosticSignError",
			"DiagnosticSignWarn",
			"DiagnosticSignInfo",
			"DiagnosticSignHint",
		},
		linehl = {
			"DiagnosticSignError",
			"DiagnosticSignWarn",
			"DiagnosticSignInfo",
			"DiagnosticSignHint",
		},
	},
	float = {
		focusable = false,
		border = "rounded",
		source = "always",
	},
})

local subcommands = {
	-- gra
	code_action = function()
		vim.lsp.buf.code_action()
	end,

	-- gri
	implementation = function()
		vim.lsp.buf.implementation()
	end,

	-- grn
	rename = function(opts)
		vim.lsp.buf.rename(opts.fargs[2] ~= "" and opts.fargs[2] or nil)
	end,

	-- grr
	references = function()
		vim.lsp.buf.references()
	end,

	-- grt
	type_definition = function()
		vim.lsp.buf.type_definition()
	end,

	-- grx
	codelens = function()
		vim.lsp.codelens.run()
	end,

	-- gO
	document_symbol = function()
		vim.lsp.buf.document_symbol()
	end,

	-- Ctrl-S
	signature_help = function()
		vim.lsp.buf.signature_help()
	end,

	-- gx
	link = function()
		vim.lsp.buf.document_link()
	end,

	-- v_an / v_in fallback
	selection_range = function()
		vim.lsp.buf.selection_range()
	end,
}

vim.api.nvim_create_user_command("Lsp", function(opts)
	local sub = opts.fargs[1]
	local fn = subcommands[sub]

	if not fn then
		vim.notify("Unknown LSP subcommand: " .. (sub or "nil"), vim.log.levels.ERROR)
		return
	end

	fn(opts)
end, {
	nargs = "+",
	complete = function(_, line)
		local args = vim.split(line, "%s+")
		if #args <= 2 then
			return vim.tbl_keys(subcommands)
		end
		return {}
	end,
})
