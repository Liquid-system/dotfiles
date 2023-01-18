return {
  "lambdalisue/fern-hijack.vim",
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },
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
    "m4xshen/autoclose.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "clock",
      },
    },
    init = function()
      -- エラーを防ぐ
      vim.api.nvim_create_autocmd("VimLeavePre", {
        command = [[silent! FidgetClose]],
      })
    end
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
