-- This file can be loaded by calling `lua require('modules')` from your init.vim
-- Only required if you have packer configured as `opt`
local ui = require "modules.ui.config"
local lsp = require "modules.completion.config"
local editor = require "modules.editor.config"
local color = require "modules.colorScheme.config"

vim.cmd('packadd vim-jetpack')
require("jetpack.packer").startup(function(use)
	use { "lewis6991/impatient.nvim" }
	use { "tani/vim-jetpack", opt = 1 } -- bootstrap
	use { "kyazdani42/nvim-web-devicons" }
	use { "NvChad/ui" }
	use { "nvim-lua/plenary.nvim" }
	--ui
	use {
		"glepnir/dashboard-nvim",
		config = ui.dashboard,
	}
	use {
		"nvim-lualine/lualine.nvim",
		config = ui.lualine,
	}
	use {
		"akinsho/bufferline.nvim",
		tag = "v3.1.0",
		config = ui.bufferline,
	}
	--treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		config = editor.treesitter,
		run = "TSUpdate",
	}
	-- htmlのタグ
	use {
		"windwp/nvim-ts-autotag",
	}
	--括弧の色
	use {
		"p00f/nvim-ts-rainbow",
	}
	-- インデント
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = editor.indent_blankline,
		opt = true,
		after = "nvim-treesitter",
	}
	--lsp
	use "williamboman/mason.nvim"
	use {
		"williamboman/mason-lspconfig.nvim",
		config = lsp.mason,
	}
	use {
		"neovim/nvim-lspconfig",
		config = lsp.lspconfig,
	}
	use {
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = lsp.saga,
	}
	use { "b0o/schemastore.nvim" }
	-- cmp
	use {
		"hrsh7th/nvim-cmp",
		config = lsp.cmp,
	}
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-nvim-lsp-signature-help" }
	use { "hrsh7th/cmp-nvim-lua" }
	use { "hrsh7th/cmp-cmdline" }
	--スニペット
	use { "saadparwaiz1/cmp_luasnip" }
	use {
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load {
				paths = { "./friendly-snippets" },
			}
		end,
	}
	use {
		"folke/trouble.nvim",
		config = ui.trouble,
	}
	use {
		"folke/neodev.nvim",
		ft = "lua",
	}
	use {
		"mattn/emmet-vim",
		fr = "html",
	}
	--リンター
	use {
		"jose-elias-alvarez/null-ls.nvim",
		config = lsp.null_ls,
	}
	--コメント
	use { "numToStr/Comment.nvim" }

	--ユーティリティ
	use {
		"max397574/better-escape.nvim",
		config = editor.better_escape,
		opt = true,
		event = "BufReadPost",
	}
	use {
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {}
		end,
		opt = true,
		event = "BufReadPost",
	}
	use {
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup {}
		end,
		opt = true,
		event = "BufReadPost",
	}
	use {
		"cohama/lexima.vim",
		opt = true,
		event = "BufReadPost",
	}
	use { "christoomey/vim-tmux-navigator" }
	use {
		"j-hui/fidget.nvim",
		event = "BufEnter",
		config = function()
			require("fidget").setup {}
		end,
	}
	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	}
	use {
		"narutoxy/silicon.lua",
		config = editor.silicon,
	}
	--フォーマッタ
	use { "gpanders/editorconfig.nvim", ft = "editorconfig" }
	--ファイラ―
	use { "lambdalisue/fern.vim", branch = "main" }
	use { "lambdalisue/fern-renderer-nerdfont.vim" }
	use { "lambdalisue/glyph-palette.vim" }
	use { "lambdalisue/nerdfont.vim" }

	--バッファ
	-- リサイズ
	use {
		"simeji/winresizer",
		config = editor.winresizer,
		cmd = "WinResizerStartResize",
	}
	--カラースキーム
	use {
		"folke/tokyonight.nvim",
		config = color.tokyonight,
	}
	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	}
end)
