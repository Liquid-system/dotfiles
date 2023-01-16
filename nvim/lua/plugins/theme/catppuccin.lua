return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "latte",
    no_italic = true,
  },
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
