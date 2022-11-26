require "core"
require "init"
require "impatient"
require "core.config"
require "core.autocmd"
require "core.disable"
require "core.options"
require "core.keymap"
vim.api.nvim_exec("runtime! vim/*.vim", false)
