if vim.fn.has "persistent_undo" then
    local target_path = vim.fn.expand "~/.undo/nvim"
    if not vim.fn.isdirectory(target_path) then
        vim.fn.mkdir(target_path, "p", 700)
    end
    vim.opt.undodir = target_path
    vim.opt.undofile = true
end

vim.g.jetpack_copy_method = 'copy'

require "core.autocmd"
require "core.config"
require "core.disable"
require "core.options"
require "keymap"
require "modules"
