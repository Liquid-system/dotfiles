vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

require "core.config"
require "core.autocmd"
require "core.disable"
require "core.options"

-- leaderキーをspaceに変更
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	}
end

vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup "plugins"

require "core.keymap"
