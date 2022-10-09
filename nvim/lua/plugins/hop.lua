-- hop.nvim
require 'hop'.setup()

-- place this in one of your configuration file(s)
local keymap = vim.keymap.set
local hop = require('hop')
local directions = require('hop.hint').HintDirection
keymap('', 'f', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

keymap('', 'F', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

keymap('', 't', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

keymap('', 'T', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

-- normal mode (easymotion-like)
keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", { noremap = true })
keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", { noremap = true })
keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", { noremap = true })
keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", { noremap = true })

-- visual mode (easymotion-like)
keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", { noremap = true })
keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", { noremap = true })
keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", { noremap = true })
keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", { noremap = true })
