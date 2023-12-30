return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "UIEnter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "CursorMoved",
    },
    {
      "windwp/nvim-ts-autotag",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = true,
      event = "InsertEnter",
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = false,
      ensure_installed = "all",
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["al"] = "@call.outer",
            ["il"] = "@call.inner",
            ["aP"] = "@parameter.outer",
            ["iP"] = "@parameter.inner",
            ["ao"] = "@conditional.outer",
            ["io"] = "@conditional.inner",
            ["as"] = "@statement.outer",
          },
        },
      },
    })
  end,
}
