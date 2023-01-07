return {
  {
    "machakann/vim-sandwich",
    event = "InsertEnter",
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "cohama/lexima.vim",
    event = "InsertEnter",
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
    end,
  },
  {
    "folke/neodev.nvim",
    ft = "lua",
  },
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "simeji/winresizer",
    cmd = "WinResizerStartResize",
    config = function()
      vim.g.winresizer_start_key = "<C-s>"
      vim.g.winresizer_vert_resize = 1
    end,
  },
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/glyph-palette.vim",
      "lambdalisue/nerdfont.vim",
    },
    keys = "<Leader>n",
    config = function()
      vim.cmd "runtime vim/fern.vim"
    end,
  },
}
