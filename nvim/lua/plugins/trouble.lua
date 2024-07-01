return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "LspAttach",
  keys = {
    { "<Leader>e", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble" },
  },
  config = true,
}
