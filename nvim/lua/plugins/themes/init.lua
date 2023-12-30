return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = false,
        operators = false,
        comments = false,
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = true,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      disable_italics = true,
    },
  },
  {
    "uloco/bluloco.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = true,
    config = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "latte",
      no_italic = true,
    },
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
  },
  {
    "rafamadriz/neon",
    lazy = true,
    config = function()
      vim.g.neon_style = "default"
      vim.g.neon_italic_comment = false
      vim.g.neon_italic_keyword = false
      vim.g.neon_italic_function = false
      vim.g.neon_transparent = true
    end,
  },
  {
    "folke/tokyonight.nvim",
    init = function()
      vim.cmd("colorscheme tokyonight")
    end,
    priority = 1000,
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
  },
}
