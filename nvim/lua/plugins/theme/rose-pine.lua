return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    disable_italics = true,
  },
  init = function()
    vim.cmd "colorscheme rose-pine"
  end,
}
