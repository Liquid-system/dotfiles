return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = true,
  },
  {
    "uga-rosa/cmp-dictionary",
    event = "InsertEnter",
    opts = {
      paths = { vim.fn.stdpath("data") .. "/dictionary/en.dict" },
    },
  },
  {
    "pocco81/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      execution_message = {
        enabled = false,
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
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "CursorMoved",
  },
}
