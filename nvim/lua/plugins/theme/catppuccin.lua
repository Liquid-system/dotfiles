return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1000,
  opts = {
    flavour = "latte",
    no_italic = true,
  },
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
}
