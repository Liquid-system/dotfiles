vim.loader.enable()
-- leaderキーをspaceに変更
vim.g.mapleader = " "
require("core.lazy")
require("core.options")
require("core.config")
require("core.autocmd")
require("core.keymap")

vim.cmd.colorscheme("tokyonight-moon")
