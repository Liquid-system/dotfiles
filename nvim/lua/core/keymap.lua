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
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", default_opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", default_opts)
-- タブの移動
keymap("n", "<Leader>e", "<cmd>TroubleToggle<CR>", default_opts)
--ESC2回で点滅が消える
keymap("n", "<ESC><ESC>", "<cmd>nohl<CR>", default_opts)
