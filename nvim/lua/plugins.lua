return {
  "lambdalisue/readablefold.vim",
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml" },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    event = "BufReadPost",
  },
  {
    "m-demare/hlargs.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("hlargs").setup()
    end,
  },
  {
    "cohama/lexima.vim",
    event = "InsertEnter"
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup {
        text = {
          spinner = "clock",
        },
      }
    end
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {}
      vim.cmd "colorscheme nightfox"
    end
  },
  {
    "gpanders/editorconfig.nvim",
    ft = "editorconfig"
  },
  {
    "folke/neodev.nvim",
    ft = "lua"
  },
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
    end
  },
  {
    "simeji/winresizer",
    cmd = "WinResizerStartResize",
    config = function()
      vim.g.winresizer_start_key = "<C-s>"
      vim.g.winresizer_vert_resize = 1
    end
  },
  {
    "narutoxy/silicon.lua",
    event = "BufRead",
    config = function()
      require("silicon").setup {}
      vim.keymap.set("v", "<Leader>li", function()
        require("silicon").visualise_api {}
      end)
    end
  },
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/glyph-palette.vim",
      "lambdalisue/nerdfont.vim",
      "lambdalisue/readablefold.vim"
    },
    config = function()
      vim.cmd("runtime vim/fern.vim")
    end
  }
}
