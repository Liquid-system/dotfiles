return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "LspAttach",
  config = true,
  init = function()
    vim.keymap.set("n", "<Leader>e", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
  end,
}
