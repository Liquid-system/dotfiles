local M = {
	"nvim-treesitter/nvim-treesitter",
	dev = false,
	build = ":TSUpdate",
	event = "BufReadPost",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
		},
		ensure_installed = "all",
	})
end
return M
