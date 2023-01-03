local M = {
  "folke/tokyonight.nvim",
}

function M.config()
  require("tokyonight").setup {
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
  }
  vim.cmd "colorscheme tokyonight"
end

return M
