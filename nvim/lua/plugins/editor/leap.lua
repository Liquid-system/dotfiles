local keymap = vim.keymap.set
keymap('n', '<Space><Space>k', "<Plug>(leap-backward)",{})
keymap('n', '<Space><Space>j', "<Plug>(leap-forward)",{})

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  pattern = '*',
  callback = function()
    require('leap').init_highlight(true)
  end,

})
