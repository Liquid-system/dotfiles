return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
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
    lazy = true,
    name = "rose-pine",

    opts = {
      disable_italics = true,
    },
  },
  {
    "uloco/bluloco.nvim",
    lazy = true,
    dependencies = "rktjmp/lush.nvim",

    config = true,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
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
    lazy = true,
    priority = 1000,
    opts = {
      style = "Moon",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
    },
  },
}
