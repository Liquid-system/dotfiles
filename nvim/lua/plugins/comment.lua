local M = {
	"numToStr/Comment.nvim",
}

function M.config()
	vim.keymap.set("n", "<Leader>/", function()
		return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
	end, { expr = true })

	vim.keymap.set("x", "<Leader>/", "<Plug>(comment_toggle_blockwise_visual)")
	vim.keymap.set("n", "<leader>a", function()
		require("Comment.api").insert.linewise.eol(require("Comment.config"):get())
	end)
end

return M
