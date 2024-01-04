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
local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

local default_opts = { silent = true, noremap = true }
-- leaderキーをspaceに変更
vim.g.mapleader = " "
--ESCで点滅が消える
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR><ESC>", opts("No highlight search"))
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], opts("Exit the terminal"))
--tabを使用する
vim.keymap.set("i", "<Leader><tab>", "<C-v><tab>", opts("tab"))
-- 論理行を表示行に置き換える
vim.keymap.set("n", "k", "gk", default_opts)
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "0", "g0", default_opts)
vim.keymap.set("n", "^", "g^", default_opts)
vim.keymap.set("n", "$", "g$", default_opts)
-- ビジュアルモードで < > キーによるインデント後にビジュアルモードが解除されないようにする
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)
-- コマンドで削除した時はヤンクしない
vim.keymap.set("n", "x", '"_x', default_opts)
vim.keymap.set("v", "x", '"_x', default_opts)
-- コピペ時の自動インデント
--[[ vim.keymap.set("n", "p", "]p", opt)
vim.keymap.set("n", "P", "]P", opt)
vim.keymap.set("n", "]p", "p", opt)
vim.keymap.set("n", "]P", "P", opt) ]]
-- バッファサイズの変更
vim.keymap.set("n", "<Up>", "<cmd>resize -1<CR>", opts("Resize UP"))
vim.keymap.set("n", "<Down>", "<cmd>resize +1<CR>", opts("Resize Down"))
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -1<CR>", opts("Resize Left"))
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +1<CR>", opts("Resize Right"))
-- バッファ間のカーソルの移動
vim.keymap.set("n", "<Leader>w", "<C-w>", opts("<C-w> shortcut"))
vim.keymap.set("n", "<Leader>j", "<C-w>j", opts("Move buffer to the Down"))
vim.keymap.set("n", "<Leader>k", "<C-w>k", opts("move buffer to the Up"))
vim.keymap.set("n", "<Leader>h", "<C-w>h", opts("Move buffer to the Left"))
vim.keymap.set("n", "<Leader>l", "<C-w>l", opts("Move buffe to the Right"))
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- LSP
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Pre diagnostic"))

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local function lsp_opts(desc)
      return { desc = desc, buffer = ev.buf }
    end
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, lsp_opts("signature"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, lsp_opts("declaration"))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, lsp_opts("implementation"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, lsp_opts("definition"))
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, lsp_opts("add_workspace_folder"))
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, lsp_opts("remove_workspace_folder"))
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, lsp_opts("list_workspace_folders"))
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, lsp_opts("type_definition"))
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, lsp_opts("code_action"))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, lsp_opts("references"))
  end,
})
