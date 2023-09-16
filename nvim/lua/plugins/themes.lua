return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      italic = false,
      overrides = {
        SignColumn = { bg = "#282828" },
      },
    },
    init = function()
      vim.cmd "colorscheme gruvbox"
    end,
  },
}
