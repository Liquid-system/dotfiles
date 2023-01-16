return {
  "lambdalisue/fern-hijack.vim",
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },
  {
    "b0o/schemastore.nvim",
    lazy = "true",
  },
  {
    "folke/neodev.nvim",
    ft = "lua",
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
      mapping = { "jj", "jk", "kj" },
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
}
