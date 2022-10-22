local disable_modules = {
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
for _, name in ipairs(disable_modules) do
  vim.g["loaded_" .. name] = 1
end
-- This file can be loaded by calling `lua require('modules')` from your init.vim
-- Only required if you have packer configured as `opt`
--vim.cmd([[packadd packer.nvim]])
local uiConf = require("modules.ui.config")
local cmpConf = require("modules.completion.config")
local editorConf = require("modules.editor.config")

vim.cmd([[packadd packer.nvim]])
require("packer").startup(function(use)
  use({ "lewis6991/impatient.nvim" })
  use({ "wbthomason/packer.nvim", opt = true }) -- bootstrap
  use({ "vim-jp/vimdoc-ja" })
  use({ "kyazdani42/nvim-web-devicons" })

  --ui
  use({
    "glepnir/dashboard-nvim",
    config = uiConf.dashboard
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = uiConf.lualine
  })
  use({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = uiConf.bufferline
  })

  --treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    run = ":TSUpdate",
    event = "BufReadPost",
    config = editorConf.treesitter
  })

  -- htmlのタグ
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", opt = true })
  --括弧の色
  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter", opt = true })

  use({
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    event = "BufReadPost",
    config = editorConf.indent_blankline,
  })
  --lsp
  use("williamboman/mason.nvim")
  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim",
    },
    config = cmpConf.mason
  })

  use({
    "neovim/nvim-lspconfig",
    requires = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
    config = cmpConf.lspconfig
  })

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = cmpConf.saga
  })
  use({ "b0o/schemastore.nvim" })
  -- cmp
  use({
    "hrsh7th/nvim-cmp",
    requires = { "NvChad/ui" },
    config = cmpConf.cmp
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
    config = uiConf.trouble
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
    config = cmpConf.null_ls,
    requires = { "nvim-lua/plenary.nvim" },
  })
  --コメント
  use({ "numToStr/Comment.nvim" })

  --ユーティリティ
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
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
    config = editorConf.winresizer,
    keys = { "<C-s>" },
  })
  --カラースキーム
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("modules.colorScheme.tokyonight")
    end,
  })
  use({ "wadackel/vim-dogrun" })
end)
