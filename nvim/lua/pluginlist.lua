-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd('runtime */jetpack.vim')
require('jetpack').startup(function(use)
	use { 'vim-jp/vimdoc-ja' }
	use { 'nathom/filetype.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	--アイコン
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'onsails/lspkind.nvim' }

	--見た目
	use { 'goolord/alpha-nvim' }
	use { 'machakann/vim-sandwich' }
	use { 'nvim-lualine/lualine.nvim' }
	--treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-treesitter/nvim-treesitter-context' }
	--括弧の色
	use { 'p00f/nvim-ts-rainbow' }
	use { 'lukas-reineke/indent-blankline.nvim' }
	--lsp
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'neovim/nvim-lspconfig' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'folke/trouble.nvim' }
	use { 'glepnir/lspsaga.nvim', branch = 'main' }
	use { 'folke/lua-dev.nvim' }
	use { 'mattn/emmet-vim', ft = 'html' }
	--スニペット
	-- use {'L3MON4D3/LuaSnip'}
	--コメント
	use { 'b3nj5m1n/kommentary' }
	use { 'preservim/nerdcommenter' }
	--移動
	use { 'phaazon/hop.nvim' }
	--ユーティリティ
	use { 'cohama/lexima.vim' }
	use { 'nvim-telescope/telescope.nvim' }
	use { 'segeljakt/vim-silicon', on = 'Silicon' }
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
	--マーク
	use { 'chentoast/marks.nvim' }
	--カラースキーム
	use { 'wadackel/vim-dogrun' }
	use { 'rafamadriz/neon' }

end)
