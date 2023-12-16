return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = false,
        operators = false,
        comments = false,
      },
    },
    init = function()
      vim.cmd "colorscheme gruvbox"
    end,
  },
}
