vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.jetpack_copy_method = 'copy'

require "core.autocmd"
require "core.config"
require "core.disable"
require "core.options"
require "keymap"
require "modules"
