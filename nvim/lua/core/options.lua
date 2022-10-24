local opt = vim.opt

opt.number = true
opt.title = true
-- 検索時の強調表示
opt.inccommand = "split"
-- カラースキーム
opt.termguicolors = true
-- Windowsでパスの区切り文字をスラッシュで扱う
opt.shellslash = true
-- 対応する括弧やブレースを表示
opt.showmatch.matchtime = 1
-- yでコピーした時にクリップボードに入る
--opt.guioptions:append("a")
-- クリップボード設定
opt.clipboard = "unnamedplus"
-- 対応する括弧を強調表示
opt.showmatch = true
-- スワップファイルを作成しない
opt.swapfile = false
-- 改行時の自動コメントアウトを無効にする
opt.formatoptions:remove("ro")
-- マウス
opt.mouse = "a"
-- ファイルエンコーディング
opt.fenc = "utf-8"
opt.fileformats = { "unix", "dos", "mac" }
-- 検索系
-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
opt.ignorecase = true
-- 検索文字列に大文字が含まれている場合は区別して検索する
opt.smartcase = true
-- 検索文字列入力時に順次対象文字列にヒットさせる
opt.incsearch = true
-- 検索時に最後まで行ったら最初に戻る
opt.wrapscan = true
-- 検索語をハイライト非表示
opt.hlsearch = true
-- 括弧をハイライト表示
opt.showmatch = true
-- 括弧秒数を調整
opt.matchtime = 1
-- cmp 設定
opt.completeopt = { "menu", "menuone", "noselect" }
-- キーの待ち時間設定
opt.timeoutlen = 250
--タブ入力時に空白を展開
opt.expandtab = true
-- tab時の見かけのスペース数
opt.tabstop = 4
-- 自動的に挿入される量
opt.shiftwidth = 4
-- インデント
opt.smartindent = true
-- 改行時にtabをスペースに変換
-- (インサート時に(Ctrl+v)+tabでtab挿入)
opt.expandtab = true

-- 制御文字を表示
opt.list = true
vim.opt.listchars = {
	tab = "▸▹┊",
	trail = "▫",
	extends = "❯",
	precedes = "❮",
}

-- 制御文字をカスタマイズ
--[[opt.listchars.tab = "»-"
opt.listchars.trail = "-"
opt.listchars.eol = "↲"
opt.listchars.extends = "»"
opt.listchars.precedes = "«"
opt.listchars.nbsp = "%"
]]
--行の改行を防ぐ
opt.linebreak = true
-- ファイルタイプ検出を有効にする
-- クリップボード
opt.clipboard = "unnamed"
-- 折り畳みを有効
opt.wrap = true
-- 仮想編集を有効
opt.virtualedit = "onemore"
-- -エラー時の音を画面表示に
opt.visualbell = true
opt.wildignore =
	".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termguicolors = true
-- 英語表示
vim.api.nvim_command("language messages en_US.UTF-8")
-- shadafileに書き込まない
vim.opt.shadafile = "NONE"
--fold
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
