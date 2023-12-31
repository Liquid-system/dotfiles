return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
		},
	},
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true, noremap = true } },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true, noremap = true } },
	},
}
