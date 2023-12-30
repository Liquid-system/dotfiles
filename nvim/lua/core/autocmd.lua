-- tmp以下はundoファイルを作らない
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "/tmp/*" },
  command = "setlocal noundofile",
})

-- ヤンク時にハイライト
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- qでヘルプを抜ける
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "startuptime",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- リサイズ時の調整
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
-- ファイル変更時に警告を発する
vim.api.nvim_create_autocmd({ "TermClose", "TermLeave", "FocusGained" }, { command = "checktime" })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Makefile",
  callback = function()
    vim.opt.smarttab = false
  end,
})
-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
