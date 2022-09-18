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
local default_opts = { silent = true }

-- jjでノーマルモードへ移行
keymap("i", "jj", "<ESC>", default_opts)
-- leaderキーをspaceに変更
vim.g.mapleader = " "
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

-- タブの移動

--ESC2回で点滅が消える
keymap("n", "<ESC><ESC>", ":nohl<CR>", default_opts)

--コメント
keymap("n", "<Leader>/",
	function()
		require("Comment.api").toggle.linewise.current()
	end, default_opts)
keymap("v", "<Leader>/",
	function()
		require("Comment.api").toggle.linewise.current()
	end, default_opts)

-- lspの設定
M.on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
	keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
	keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
	keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	keymap('n', 'gr', vim.lsp.buf.references, bufopts)
	keymap('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	keymap('n', 'K', vim.lsp.buf.hover, bufopts)
	--saga
	local saga = require('lspsaga')
	saga.init_lsp_saga()
	-- Lsp finder find the symbol definition implement reference
	-- when you use action in finder like open vsplit then you can
	-- use <C-t> to jump back
	keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
	keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
	keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
	keymap("n", "gp", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
	keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
	keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
	-- Diagnsotic jump can use `<c-o>` to jump back
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
	-- Only jump to error
	keymap("n", "[E", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })
	keymap("n", "]E", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })
	keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
	--keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
end

return M
