-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd('runtime */jetpack.vim')
require('jetpack').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'vim-jp/vimdoc-ja' }
	use { 'nathom/filetype.nvim' }
	--アイコン
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'onsails/lspkind.nvim' }

	use { 'machakann/vim-sandwich' }
	use { 'phaazon/hop.nvim' }
	use { 'nvim-lualine/lualine.nvim' }
	--treesitter
	use { 'nvim-treesitter/nvim-treesitter', run =':TSUpdate'}
	use { 'nvim-treesitter/nvim-treesitter-context' }
	use { 'p00f/nvim-ts-rainbow' }
	--lsp
	use { 'neovim/nvim-lspconfig' }
	use { 'williamboman/nvim-lsp-installer' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'folke/trouble.nvim' }
	use { 'mattn/emmet-vim', ft = 'html' }
	use { 'j-hui/fidget.nvim' }
	use { 'mattn/efm-langserver' }
	use { 'jiangmiao/auto-pairs' }
	--コメント
	use { 'numToStr/Comment.nvim' }

	use { 'segeljakt/vim-silicon' ,on = 'Silicon'}
	use { 'rhysd/devdocs.vim' }
	use { 'vim-scripts/vim-auto-save' }
	use { 'liuchengxu/vista.vim' }
	use { 'numToStr/FTerm.nvim' }
	use { 'simeji/winresizer'}
	--フォーマッタ
	use { 'editorconfig/editorconfig-vim' }

	--ファイラ―
	use { 'lambdalisue/fern.vim' }
	use { 'lambdalisue/fern-renderer-nerdfont.vim' }
	use { 'lambdalisue/glyph-palette.vim' }
	use { 'lambdalisue/fern-hijack.vim' }
	use { 'lambdalisue/nerdfont.vim' }
	--カラースキーム
	use { 'joshdick/onedark.vim' }
	use { 'wadackel/vim-dogrun' }
	use { 'mhartington/oceanic-next' }
	use { 'tomasiser/vim-code-dark' }
	use { 'bluz71/vim-nightfly-guicolors' }
	use { "rafamadriz/neon" }
	use { 'morhetz/gruvbox' }
	use { 'folke/tokyonight.nvim' }
end)
