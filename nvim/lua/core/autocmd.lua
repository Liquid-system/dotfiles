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

-- fidgetのエラーを防ぐ
vim.api.nvim_create_autocmd("VimLeavePre", { command = [[silent! FidgetClose]] })

-- ジャンプ先でカーソル位置の復元
local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if { row, col } ~= { 0, 0 } then
      vim.api.nvim_win_set_cursor(0, { row, 0 })
    end
  end,
  group = group,
})
