return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      italic = {
        strings = false,
        operators = false,
        comments = false,
      },
      overrides = {
        SignColumn = { bg = "#282828" },
      },
    },
    init = function()
      vim.cmd "colorscheme gruvbox"
    end,
  },
}
