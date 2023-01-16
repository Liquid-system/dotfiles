return {
    "EdenEast/nightfox.nvim",
  lazy = true,
  priority = 1000,
  config = true,
  init = function()
    vim.cmd "colorscheme nightfox"
  end,
}
