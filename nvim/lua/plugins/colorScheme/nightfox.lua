return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup {}
    vim.cmd "colorscheme nightfox"
  end,
}
