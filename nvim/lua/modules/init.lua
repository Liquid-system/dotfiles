vim.g.jetpack_copy_method = "copy"
local ui = require "modules.ui"
local lsp = require "modules.completion"
local editor = require "modules.editor"
local command = require "modules.command"
local tools = require "modules.tools"
local color = require "modules.colorScheme"

vim.cmd [[packadd packer.nvim]]
--vim.cmd "packadd vim-jetpack"
require("packer").startup(function(use)
	use { "lewis6991/impatient.nvim" }
	use { "tani/vim-jetpack", opt = 1 } -- bootstrap
	use { "wbthomason/packer.nvim", opt = 1 } -- bootstrap
	use { "kyazdani42/nvim-web-devicons" }
	use { "onsails/lspkind.nvim" }
	use { "nvim-lua/plenary.nvim" }
	--lsp
	use "williamboman/mason.nvim"
	use {
		"williamboman/mason-lspconfig.nvim",
	}
	use {
		"neovim/nvim-lspconfig",
		config = lsp.lspconfig,
	}
	use {
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = lsp.lspsaga,
	}
	-- cmp
	use {
		"hrsh7th/nvim-cmp",
	}
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-nvim-lsp-signature-help" }
	use { "hrsh7th/cmp-nvim-lua" }
	use { "hrsh7th/cmp-cmdline", config = lsp.cmp }
	--スニペット
	use { "saadparwaiz1/cmp_luasnip" }
	use {
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = lsp.luaship,
	}
	--ツール
	use {
		"jose-elias-alvarez/null-ls.nvim",
		config = lsp.null_ls,
	}

	use { "b0o/schemastore.nvim" }
	--editor
	--treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		config = editor.treesitter,
		run = "TSUpdate",
	}
	-- インデント
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = editor.indent_blankline,
		opt = true,
		after = "nvim-treesitter",
	}
	-- htmlのタグ
	use {
		"windwp/nvim-ts-autotag",
	}
	--括弧の色
	use {
		"p00f/nvim-ts-rainbow",
	}
	use {
		"folke/neodev.nvim",
		ft = "lua",
	}
	use {
		"mattn/emmet-vim",
		config = tools.emmet,
		ft = "html",
	}
	--コメント
	use { "numToStr/Comment.nvim" }
	--ユーティリティ
	use {
		"max397574/better-escape.nvim",
		config = tools.better_escape,
	}
	use {
		"Pocco81/auto-save.nvim",
		config = tools.auto_save,
	}
	use {
		"kylechui/nvim-surround",
		config = tools.surround,
	}
	use { "cohama/lexima.vim", event = "InsertEnter" }
	use { "christoomey/vim-tmux-navigator", opt = true }
	--ui
	use {
		"folke/trouble.nvim",
		config = ui.trouble,
	}
	use {
		"j-hui/fidget.nvim",
		event = "BufEnter",
		config = ui.finget,
	}
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
	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		opt = true,
	}
	--フォーマッタ
	use { "gpanders/editorconfig.nvim", ft = "editorconfig" }
	--ファイラ―
	use { "lambdalisue/fern.vim", branch = "main" }
	use { "lambdalisue/fern-renderer-nerdfont.vim" }
	use { "lambdalisue/glyph-palette.vim" }
	use { "lambdalisue/nerdfont.vim" }

	--バッファ
	--スクリーンショット
	use {
		"narutoxy/silicon.lua",
		config = command.silicon,
		opt = true,
	}
	-- リサイズ
	use {
		"simeji/winresizer",
		config = command.winresizer,
		cmd = "WinResizerStartResize",
	}
	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = command.colorizer,
	}
	--カラースキーム
	use {
		"EdenEast/nightfox.nvim",
		config = color.nightfox,
	}
	--[[ use {
		"folke/tokyonight.nvim",
		config = color.tokyonight,
	} ]]
end)
