return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
    },
  },
  init = function()
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true, noremap = true })
  end,
}
