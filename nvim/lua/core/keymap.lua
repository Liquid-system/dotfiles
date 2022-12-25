--[[
'' (an empty string)	mapmode-nvo	Normal, Visual, Select, Operator-pending
'n' Normal	:nmap
'v' Visual and Select
's' Select	:smap
'x' Visual	:xmap
'o' Operator-pending
'!' Insert and Command-line
'i' Insert	:imap
'l' Insert, Command-line, Lang-Arg
'c' Command-line
't' Terminal
--]]
local M = {}

local keymap = vim.keymap.set
local default_opts = { silent = true, noremap = true }

-- F5でluaを実行
keymap("n", "<F5>", "<cmd>luafile %<CR>", default_opts)
-- jjでノーマルモードへ移行
keymap("i", "jj", "<ESC>", default_opts)
-- 表示行と論理行を入れ替える
keymap("n", "k", "gk", default_opts)
keymap("n", "gk", "k", default_opts)
keymap("n", "j", "gj", default_opts)
keymap("n", "gj", "j", default_opts)

-- ビジュアルモードで < > キーによるインデント後にビジュアルモードが解除されないようにする
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- インサートモード中でも移動する
keymap("i", "<C-h>", "<Left>", default_opts)
keymap("i", "<C-l", "<Right>", default_opts)

-- ヤンクした内容が上書きされないようにする
keymap("n", "PP", '"0p', default_opts)

-- コマンドで削除した時はヤンクしない
keymap("n", "x", '"_x', default_opts)
keymap("v", "x", '"_x', default_opts)

-- コピペ時の自動インデント
keymap("n", "p", "]p", default_opts)
keymap("n", "P", "]P", default_opts)
keymap("n", "]p", "p", default_opts)
keymap("n", "]P", "P", default_opts)

-- 画面間でのカーソルの移動
keymap("n", "<Leader>j", "<C-w>j", default_opts)
keymap("n", "<Leader>k", "<C-w>k", default_opts)
keymap("n", "<Leader>h", "<C-w>h", default_opts)
keymap("n", "<Leader>l", "<C-w>l", default_opts)

-- タブライン
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", default_opts)
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", default_opts)
-- タブの移動
keymap("n", "<Leader>e", "<Cmd>TroubleToggle<CR>", default_opts)
--ESC2回で点滅が消える
keymap("n", "<ESC><ESC>", "<Cmd>nohl<CR>", default_opts)



--lspsaga
-- Lsp finder find the symbol definition implement reference
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
--keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
end, { silent = true })
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<leader>i", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- close floaterm
keymap("t", "<leader>i", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

return M
