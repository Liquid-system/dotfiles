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
-- fidgetのエラーを防ぐ
vim.api.nvim_create_autocmd("VimLeavePre", { command = [[silent! FidgetClose]] })

-- ファイル変更時に警告を発する
vim.api.nvim_create_autocmd({ "TermClose", "TermLeave", "FocusGained" }, { command = "checktime" })

-- ファイルを開いた時に、カーソルの場所を復元する
local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if { row, col } ~= { 0, 0 } then
      vim.api.nvim_win_set_cursor(0, { row, 0 })
    end
  end,
})
