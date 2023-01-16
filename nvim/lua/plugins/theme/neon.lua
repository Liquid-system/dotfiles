return {
  "rafamadriz/neon",
  lazy = true,
  priority = 1000,
  config = function()
    vim.g.neon_style = "default"
    vim.g.neon_italic_comment = false
    vim.g.neon_italic_keyword = false
    vim.g.neon_italic_function = false
    vim.g.neon_transparent = true
    vim.cmd "colorscheme neon"
  end,
}
