return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      theme = "iceberg",
      globalstatus = true,
      component_separators = "｜",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_x = { "encoding", "filetype", "fileformat" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    },
  },
}
