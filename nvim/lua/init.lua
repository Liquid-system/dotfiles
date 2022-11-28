vim.cmd [[packadd packer.nvim]]
-- vim.cmd('packadd vim-jetpack')
require("packer").startup(function(use)
	use { "lewis6991/impatient.nvim" }
	-- use { 'tani/vim-jetpack', opt = 1 } -- bootstrap
	use { "wbthomason/packer.nvim", opt = 1 } --bootstrap
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
		config = function()
			require("modules.completion.lspconfig")
		end
	}
	use {
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("modules.completion.lspsaga")
		end
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
	use { "hrsh7th/cmp-cmdline",
		config = function()
			require("modules.completion.cmp")
		end }
	--スニペット
	use { "saadparwaiz1/cmp_luasnip" }
	use {
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = function()
			require("modules.completion.luasnip")
		end
	}
	use { "b0o/schemastore.nvim" }

	use {
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("modules.completion.null-ls")
		end
	}
	--treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("modules.editor.treesitter")
		end,
	}
	-- インデント
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("modules.editor.indent_blankline")
		end,
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
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		config = function()
			require("modules.editor.telescope")
		end,
		opt = true,
	}
	use {
		"folke/neodev.nvim",
		ft = "lua",
	}
	use {
		"mattn/emmet-vim",
		config = function()
			require("modules.tools.emmet-vim")
		end,
		ft = "html",
	}
	--コメント
	use { "numToStr/Comment.nvim" }
	--ユーティリティ
	use {
		"max397574/better-escape.nvim",
		config = function()
			require("modules.tools.better_escape")
		end
	}
	use {
		"Pocco81/auto-save.nvim",
		config = function()
			require("modules.tools.auto-save")
		end
	}
	use {
		"kylechui/nvim-surround",
		config = function()
			require("modules.tools.surround")
		end
	}
	use { "cohama/lexima.vim", event = "InsertEnter" }
	use { "christoomey/vim-tmux-navigator", opt = true }
	--ui
	use {
		"folke/trouble.nvim",
		config = function()
			require("modules.ui.trouble")
		end
	}
	use {
		"j-hui/fidget.nvim",
		--event = "BufEnter",
		config = function()
			require("modules.ui.finget")
		end
	}
	use {
		"glepnir/dashboard-nvim",
		config = function()
			require("modules.ui.dashboard")
		end
	}
	use {
		"nvim-lualine/lualine.nvim",
		config = function()
			require("modules.ui.lualine")
		end
	}
	use {
		"akinsho/bufferline.nvim",
		tag = "v3.1.0",
		config = function()
			require("modules.ui.bufferline")
		end
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
		config = function()
			require("modules.command.silicon")
		end,
		opt = true,
	}
	-- リサイズ
	use {
		"simeji/winresizer",
		cmd = "WinResizerStartResize",
		config = function()
			require("modules.command.winresizer")
		end
	}
	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("modules.command.colorizer")
		end
	}
	--カラースキーム
	use {
		"EdenEast/nightfox.nvim",
		config = function()
			require "modules.colorScheme.nightfox"
		end
	}
end)
