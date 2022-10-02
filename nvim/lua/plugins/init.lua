-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true } -- bootstrap
  use { 'vim-jp/vimdoc-ja' }
  use { "lewis6991/impatient.nvim",
    config = function()
      require('impatient')
    end
  }
  use { 'nvim-lua/plenary.nvim' }
  --アイコン
  use { 'NvChad/ui' }
  use { 'kyazdani42/nvim-web-devicons' }
  --ui
  use { 'goolord/alpha-nvim',
    config = function()
      require("plugins.alpha")
    end }
  use { 'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end, }
  -- using packer.nvim
  use { 'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("plugins.bufferline")
    end, }

  --treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require("plugins.treesitter")
        end, }

  use { "windwp/nvim-ts-autotag" }
  --括弧の色
  use { 'p00f/nvim-ts-rainbow' }
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.blankline')
    end }
  --lsp
  use { 'williamboman/mason.nvim',
    config = function()
      require('plugins.lsp.mason')
    end, }
  use { 'williamboman/mason-lspconfig.nvim' }

  use { 'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp.lspconfig')
    end, }

  use { 'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require("plugins.lsp.saga")
    end, }

  -- cmp
  use { 'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.lsp.cmp')
    end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip'
    }
  }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-cmdline' }
  --スニペット
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip',
    event = "InsertEnter",
    config = function()
      require("plugins.snippets")
    end, }

  use { 'folke/trouble.nvim',
    config = function()
      require("plugins.trouble")
    end, }
  use { 'folke/lua-dev.nvim', }
  --リンター
  use { 'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("plugins.lsp.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }
  --コメント
  use { 'numToStr/Comment.nvim', }
  --移動
  use { 'machakann/vim-sandwich' }
  use { 'aznhe21/hop.nvim',
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

  --フォーマッタ
  use { 'editorconfig/editorconfig-vim',
    ft = "editorconfig" }
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

  --カラースキーム
  use { 'folke/tokyonight.nvim',
    config = function()
      require("plugins.colorScheme.tokyonight")
    end }
  use { 'wadackel/vim-dogrun' }

end)
