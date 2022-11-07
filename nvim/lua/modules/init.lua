-- This file can be loaded by calling `lua require('modules')` from your init.vim
-- Only required if you have packer configured as `opt`
--vim.cmd([[packadd packer.nvim]])
local uiConf = require "modules.ui.config"
local cmpConf = require "modules.completion.config"
local editorConf = require "modules.editor.config"
local colorConf = require "modules.colorScheme.config"

vim.cmd [[packadd packer.nvim]]
require("packer").startup(function(use)
    use { "lewis6991/impatient.nvim" }
    use { "wbthomason/packer.nvim", opt = true } -- bootstrap
    -- use { "vim-jp/vimdoc-ja" }
    use { "kyazdani42/nvim-web-devicons" }

    --ui
    use {
        "glepnir/dashboard-nvim",
        config = uiConf.dashboard,
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = uiConf.lualine,
    }
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        config = uiConf.bufferline,
    }

    --treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = editorConf.treesitter,
        run = ":TSUpdate",
    }

    -- htmlのタグ
    use {
        "windwp/nvim-ts-autotag",
        opt = true,
        after = "nvim-treesitter",
    }
    --括弧の色
    use {
        "p00f/nvim-ts-rainbow",
        opt = true,
        after = "nvim-treesitter",
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = editorConf.indent_blankline,
        opt = true,
        after = "nvim-treesitter",
    }
    --lsp
    use "williamboman/mason.nvim"
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim",
        },
        config = cmpConf.mason,
    }

    use {
        "neovim/nvim-lspconfig",
        requires = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
        config = cmpConf.lspconfig,
    }

    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = cmpConf.saga,
    }
    use { "b0o/schemastore.nvim" }
    -- cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = { "NvChad/ui" },
        config = cmpConf.cmp,
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
        config = uiConf.trouble,
    }
    use {
        "folke/neodev.nvim",
        ft = "lua",
        config = function()
            require("neodev").setup()
        end,
    }
    use {
        "mattn/emmet-vim",
        fr = "html",
    }
    --リンター
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = cmpConf.null_ls,
        requires = { "nvim-lua/plenary.nvim" },
    }
    --コメント
    use { "numToStr/Comment.nvim" }

    --ユーティリティ
    use {
        "max397574/better-escape.nvim",
        config = editorConf.better_escape,
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
        tag = "*",
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
        requires = { { "nvim-lua/plenary.nvim" } },
    }
    use {
        "narutoxy/silicon.lua",
        requires = { "nvim-lua/plenary.nvim" },
        config = editorConf.silicon,
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
        config = editorConf.winresizer,
        keys = { "<C-s>" },
    }
    --カラースキーム
    use {
        "folke/tokyonight.nvim",
        config = colorConf.tokyonight,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("colorizer").setup()
        end,
    }
end)
