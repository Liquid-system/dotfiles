local disable_plugins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
}
for _, name in ipairs(disable_plugins) do
	vim.g["loaded_" .. name] = 1
end
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
--vim.cmd([[packadd packer.nvim]])
vim.cmd([[packadd packer.nvim]])
require("packer").startup(function(use)
	use({ "lewis6991/impatient.nvim" })
	use({ "wbthomason/packer.nvim", opt = true }) -- bootstrap
	use({ "vim-jp/vimdoc-ja" })

	--ui
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.ui.alpha")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.ui.lualine")
		end,
	})
	-- using packer.nvim
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.ui.bufferline")
		end,
	})

	--treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		run = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("plugins.editor.treesitter")
		end,
	})

	-- htmlのタグ
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", opt = true })
	--括弧の色
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter", opt = true })

	use({
		"lukas-reineke/indent-blankline.nvim",
		opt = true,
		event = "BufReadPost",
		config = function()
			require("plugins.editor.blankline")
		end,
	})
	--lsp
	use("williamboman/mason.nvim")
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		requires = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
		config = function()
			require("plugins.lsp.lspconfig")
		end,
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("plugins.lsp.saga")
		end,
	})
	use({ "b0o/schemastore.nvim" })
	-- cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = { "NvChad/ui" },
		config = function()
			require("plugins.lsp.cmp")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-cmdline" })

	--スニペット
	use({ "saadparwaiz1/cmp_luasnip" })
	use({
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { "./friendly-snippets" },
			})
		end,
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("plugins.ui.trouble")
		end,
	})
	use({
		"folke/neodev.nvim",
		ft = "lua",
		config = function()
			require("neodev").setup()
		end,
	})
	use({
		"mattn/emmet-vim",
		fr = "html",
	})
	--リンター
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.lsp.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	--コメント
	use({ "numToStr/Comment.nvim" })

	--ユーティリティ
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	})
	use({ "cohama/lexima.vim" })
	use({ "machakann/vim-sandwich" })
	use({ "christoomey/vim-tmux-navigator" })
	use({
		"j-hui/fidget.nvim",
		event = "BufEnter",
		config = function()
			require("fidget").setup({})
		end,
	})
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("plugins.lsp.nvim-ufo")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"segeljakt/vim-silicon",
		cmd = { "Silicon" },
		opt = true,
	})
	--フォーマッタ
	use({ "gpanders/editorconfig.nvim", ft = "editorconfig" })
	--ファイラ―
	use({ "lambdalisue/fern.vim", branch = "main" })
	use({ "lambdalisue/fern-renderer-nerdfont.vim" })
	use({ "lambdalisue/glyph-palette.vim" })
	use({ "lambdalisue/nerdfont.vim" })

	--バッファ
	-- リサイズ
	use({
		"simeji/winresizer",
		config = function()
			require("plugins.editor.winresizer")
		end,
		keys = { "<C-s>" },
	})

	--マーク

	--カラースキーム
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("plugins.colorScheme.tokyonight")
		end,
	})
	use({ "wadackel/vim-dogrun" })
end)
