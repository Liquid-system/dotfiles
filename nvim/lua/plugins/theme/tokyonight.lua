return {
  "folke/tokyonight.nvim",
  opts = {
    style = "Moon",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = {},
      variables = {},
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark", -- style for floating windows
    },
  },
  init = function()
    vim.cmd "colorscheme tokyonight"
  end
}
