vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

require "core.config"
require "core.autocmd"
require "core.options"
require "core.keymap"

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
require("lazy").setup("plugins", {
	performance = {
		rtp = {
			disable_plugins = {
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"gzip",
				"zip",
				"zipPlugin",
				"tar",
				"tarPlugin",
				"getscript",
				"getscriptPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
				"logipat",
				"rrhelper",
				"spellfile_plugin",
			},
		},
	},
})
