require('lualine').setup {
	options = { theme = 'palenight',
		component_separators = '｜',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '' }, right_padding = 2 },
		},
		lualine_c = {
			{
				'diagnostics',
				sources = { 'nvim_lsp', 'nvim_diagnostic' },
				-- Displays diagnostics for the defined severity types
				sections = { 'error', 'warn', 'info', 'hint' },

				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = 'DiagnosticError', -- Changes diagnostics' error color.
					warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
					info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
					hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
				},
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			}
		},

		lualine_x = { 'encoding', 'filetype', 'fileformat' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	}
}
