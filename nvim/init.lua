-- 背景を透明にする
-- autocmd ColorScheme * highlight Normal guibg=NONE
require ("core")
require ("core.mappings")
require ("plugins")
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_exec("runtime! configs/*.vim",	false)
