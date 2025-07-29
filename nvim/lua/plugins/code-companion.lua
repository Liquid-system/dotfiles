return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- どのadapterを使うか指定
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" },
    },
    opts = {
      language = "Japanese",
    },
  },
}
