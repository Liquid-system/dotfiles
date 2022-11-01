-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd({ "Colorscheme" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- tmp以下はundoファイルを作らない
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "/tmp/*" },
	command = "setlocal noundofile",
})

--インサートmodeで開始するgitcommit
vim.api.nvim_create_augroup("bufcheck", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "bufcheck",
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
})

-- fingetのエラーを防ぐ
vim.api.nvim_create_autocmd("VimLeavePre", { command = [[silent! FidgetClose]] })
