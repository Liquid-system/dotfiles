return {
	"lambdalisue/fern.vim",
	dependencies = {
		"lambdalisue/fern-renderer-nerdfont.vim",
		"lambdalisue/glyph-palette.vim",
		"lambdalisue/nerdfont.vim",
	},
	init = function()
		vim.keymap.set("n", "<Leader>n", "<cmd>:Fern . -drawer -reveal=% -toggle<CR>")
	end,
	config = function()
		vim.g["fern#renderer#default#leading"] = "│"
		vim.g["fern#renderer#default#root_symbol"] = "┬ "
		vim.g["fern#renderer#default#leaf_symbol"] = "├─ "
		vim.g["fern#renderer#default#collapsed_symbol"] = "├─ "
		vim.g["fern#renderer#default#expanded_symbol"] = "├┬ "
		vim.g["fern#renderer"] = "nerdfont"
		vim.g["fern#renderer#nerdfont#indent_markers"] = 1
		vim.g["fern#default_hidden"] = 1

		local palette = vim.api.nvim_create_augroup("palette", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = palette,
			pattern = "fern",
			callback = function()
				vim.call("glyph_palette#apply")
			end
		})
		vim.api.nvim_create_autocmd("FileType", {
			group = palette,
			pattern = { "nerdtree", "startify" },
			callback = function()
				vim.call("glyph_palette#apply")
			end
		})

	end
}
