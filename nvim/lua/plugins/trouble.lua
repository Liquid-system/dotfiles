return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "LspAttach",
  keys = {
    { "<Leader>e", "<cmd>TroubleToggle<CR>", desc = "Trouble" },
  },
  config = true,
}
