vim.g.mapleader = " "
require "core.lazy"
require "core.options"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "core.config"
    require "core.autocmd"
    require "core.keymap"
  end,
})
