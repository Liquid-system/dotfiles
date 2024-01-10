vim.loader.enable()
-- leaderキーをspaceに変更
vim.g.mapleader = " "
require("core.options")
require("core.autocmd")
require("core.keymap")
require("core.lsp")
require("core.lazy")
vim.cmd.colorscheme("tokyonight-moon")
