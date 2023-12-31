return {
	"ray-x/lsp_signature.nvim",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		hint_enable = false,
		toggle_key = "<C-k>",
		select_signature_key = "<C-n>",
		floating_window_off_x = 5, -- adjust float windows x position.
		floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
			local pumheight = vim.o.pumheight
			local winline = vim.fn.winline() -- line number in the window
			local winheight = vim.fn.winheight(0)
			-- window top
			if winline - 1 < pumheight then
				return pumheight
			end
			-- window bottom
			if winheight - winline < pumheight then
				return -pumheight
			end
			return 0
		end,
	},
}
