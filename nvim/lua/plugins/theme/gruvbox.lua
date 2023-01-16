return {
  "ellisonleao/gruvbox.nvim",
  lazy = true,
  priority = 1000,
  opts = {
    italic = false,
  },
  init = function()
    vim.cmd "colorscheme gruvbox"
  end,
}
