return {
    "projekt0n/github-nvim-theme",
  lazy = true,
  priority = 1000,
  config = function()
    require("github-theme").setup()
  end,
}
