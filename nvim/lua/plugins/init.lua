-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim', opt = true } -- bootstrap
	use { 'vim-jp/vimdoc-ja' }
	use { 'nathom/filetype.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	--アイコン
	use { 'NvChad/ui' }
	use { 'kyazdani42/nvim-web-devicons' }
	--見た目
	use { 'goolord/alpha-nvim',
		config = function()
			require("plugins.alpha")
		end }
	use { 'nvim-lualine/lualine.nvim',
		config = function()
			require('plugins.lualine')
		end, }

	--treesitter
	use { 'nvim-treesitter/nvim-treesitter',
		config = function()
			require("plugins.treesitter")
		end, }

	use { 'nvim-treesitter/nvim-treesitter-context' }
	--括弧の色
	use { 'p00f/nvim-ts-rainbow' }
	use { 'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('plugins.blankline')
		end }
	--lsp
	use { 'williamboman/mason.nvim',
		config = function()
			require('plugins.mason')
		end, }
	use { 'williamboman/mason-lspconfig.nvim' }

	use { 'neovim/nvim-lspconfig',
		config = function()
			require('plugins.lspconfig')
		end, }

	-- cmp
	use { 'hrsh7th/nvim-cmp',
		config = function()
			require "plugins.cmp"
		end, }
	use { 'hrsh7th/cmp-nvim-lsp',
		config = function()
			require('plugins.cmp')
			require('plugins.lspconfig')
		end, }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'hrsh7th/cmp-cmdline' }
	--スニペット
	use { 'saadparwaiz1/cmp_luasnip' }
	use { 'rafamadriz/friendly-snippets',
		event = "InsertEnter", }

	use { 'L3MON4D3/LuaSnip',
		wants = "friendly-snippets", }

	use { 'folke/trouble.nvim',
		config = function()
			require("plugins.trouble")
		end, }
	use { 'glepnir/lspsaga.nvim', branch = 'main' }
	use { 'folke/lua-dev.nvim' }
	use { 'mattn/emmet-vim', ft = 'html' }

	--リンター
	use { 'jose-elias-alvarez/null-ls.nvim',
		config = function()
			require("plugins.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	}
	--コメント
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	--移動
	use { 'machakann/vim-sandwich' }
	use { 'phaazon/hop.nvim',
		config = function()
			require("plugins.hop")
		end
	}
	use { 'christoomey/vim-tmux-navigator' }

	--ユーティリティ
	use { 'cohama/lexima.vim' }
	use { 'nvim-telescope/telescope.nvim' }
	use { 'segeljakt/vim-silicon', cmd = { 'Silicon' } }
	use { 'vim-scripts/vim-auto-save' }
	use { 'numToStr/FTerm.nvim' }
	--フォーマッタ
	use { 'editorconfig/editorconfig-vim' }

	--ファイラ―
	use { 'lambdalisue/fern.vim', branch = 'main' }
	use { 'lambdalisue/fern-renderer-nerdfont.vim' }
	use { 'lambdalisue/glyph-palette.vim' }
	use { 'lambdalisue/nerdfont.vim' }
	--バッファ
	-- リサイズ
	use { 'simeji/winresizer',
		config = function()
			require("plugins.winresizer")
		end }
	--マーク
	use { 'chentoast/marks.nvim' }
	--カラースキーム
	use { 'folke/tokyonight.nvim',
		config = function()
			require("plugins.colorScheme.tokyonight")
		end }
	use { 'wadackel/vim-dogrun' }
end)
