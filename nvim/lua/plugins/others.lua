return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = true
  },
  {
    "uga-rosa/cmp-dictionary",
    opts = {
      paths = { vim.fn.stdpath("data") .. "/dictionary/en.dict" },
    }
  },
  {
    "okuuva/auto-save.nvim",                  -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      execution_message = {
        enabled = false
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "kj", "jj" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    config = true,
    event = "InsertEnter",
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = true
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "CursorMoved",
  },
}
