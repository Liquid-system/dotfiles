if vim.fn.has("persistent_undo") then
	local target_path = vim.fn.expand("~/.undo/nvim")
	if not vim.fn.isdirectory(target_path) then
		vim.fn.mkdir(target_path, "p", 700)
	end
	vim.opt.undodir = target_path
	vim.opt.undofile = true
end

if vim.loop.os_uname().sysname == "Darwin" then
	vim.g.clipboard = {
		name = "macOS-clipboard",
		copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
		paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
		cache_enabled = 0,
    }

elseif vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = 0,
	}
end

require("core.mappings")
require("core.options")
require("core.autocmd")
require("plugins")
