local config = {}

function config.neon()
	vim.g.neon_style = "default"
	vim.g.neon_italic_comment = false
	vim.g.neon_italic_keyword = false
	vim.g.neon_italic_function = false
	vim.g.neon_transparent = true
	vim.cmd([[colorscheme neon]])
end

function config.tokyonight()
	require("tokyonight").setup({
		style = "Moon",
		transparent = true,
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
	vim.cmd([[colorscheme tokyonight]])
end

return config
