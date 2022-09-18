require("tokyonight").setup({
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
		functions = {},
		variables = {},
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
})
vim.cmd [[colorscheme tokyonight]]