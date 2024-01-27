vim.loader.enable()
-- leaderキーをspaceに変更
vim.g.mapleader = " "
require("core.options")
require("core.lazy")
vim.cmd.colorscheme("tokyonight-moon")
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("core.autocmd")
    require("core.keymap")
    require("core.lsp")
  end,
})
