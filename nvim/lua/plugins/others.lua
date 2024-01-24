return {
  {
    "uga-rosa/cmp-dictionary",
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
      paths = { vim.fn.stdpath("data") .. "/dictionary/en.dict" },
      exact_length = 2,
      first_case_insensitive = true,
      document = {
        enable = true,
        command = { "wn", "${label}", "-over" },
      },
    }
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
}
