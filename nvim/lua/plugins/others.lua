return {
	{
		"luukvbaal/nnn.nvim",
		keys = {
			{ "<Leader>n", "<cmd>NnnExplorer<CR>" },
		},
		opts = {
			auto_close = true,
			replace_netrw = "explorer",
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},
	{
		"max397574/better-escape.nvim",
		opts = {
			mapping = { "jj", "jk", "kj" },
		},
	},
	{
		"m4xshen/autoclose.nvim",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
}
