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
local default_opts = { silent = true, noremap = true }

-- leaderキーをspaceに変更
vim.g.mapleader = " "
-- F5でluaを実行
vim.keymap.set("n", "<F5>", "<cmd>luafile %<CR>", default_opts)
-- jjでノーマルモードへ移行
vim.keymap.set("i", "jj", "<ESC>", default_opts)
--ESC2回で点滅が消える
vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohl<CR>", default_opts)
-- 表示行と論理行を入れ替える
vim.keymap.set("n", "k", "gk", default_opts)
vim.keymap.set("n", "gk", "k", default_opts)
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "gj", "j", default_opts)
-- ビジュアルモードで < > キーによるインデント後にビジュアルモードが解除されないようにする
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)
-- インサートモード中でも移動する
vim.keymap.set("i", "<C-h>", "<Left>", default_opts)
vim.keymap.set("i", "<C-l", "<Right>", default_opts)
-- ヤンクした内容が上書きされないようにする
vim.keymap.set("n", "PP", '"0p', default_opts)
-- コマンドで削除した時はヤンクしない
vim.keymap.set("n", "x", '"_x', default_opts)
vim.keymap.set("v", "x", '"_x', default_opts)
-- コピペ時の自動インデント
vim.keymap.set("n", "p", "]p", default_opts)
vim.keymap.set("n", "P", "]P", default_opts)
vim.keymap.set("n", "]p", "p", default_opts)
vim.keymap.set("n", "]P", "P", default_opts)
-- 画面間でのカーソルの移動
vim.keymap.set("n", "<Leader>w", "<C-w>", default_opts)
vim.keymap.set("n", "<Leader>j", "<C-w>j", default_opts)
vim.keymap.set("n", "<Leader>k", "<C-w>k", default_opts)
vim.keymap.set("n", "<Leader>h", "<C-w>h", default_opts)
vim.keymap.set("n", "<Leader>l", "<C-w>l", default_opts)
