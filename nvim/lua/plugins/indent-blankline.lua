return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
  opts = {
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "Trouble",
        "lazy",
      },
    },
  },
}
