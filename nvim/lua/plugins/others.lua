return {
  "lambdalisue/fern-hijack.vim",
  {
    "b0o/schemastore.nvim",
    lazy = "true",
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jj", "jk", "kj" },
    },
  },
  {
    "m4xshen/autoclose.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
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
}
