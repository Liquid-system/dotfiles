return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },
  {
    "folke/neodev.nvim",
    ft = "lua",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    opts = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
  },
  {
    "machakann/vim-sandwich",
    event = "InsertEnter",
  },
  {
    "Pocco81/auto-save.nvim",
    config = true,
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "jj", "kj" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml" },
    config = true,
  },
  {
    "cohama/lexima.vim",
    event = "InsertEnter",
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "clock",
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "LspAttach",
    config = true,
    init = function()
      vim.keymap.set("n", "<Leader>e", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
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
