local opt = vim.opt
opt.number = true
opt.title = true
opt.termguicolors = true
opt.inccommand = "split" -- 検索時の強調表示
opt.shellslash = true -- Windowsでパスの区切り文字をスラッシュで扱う
opt.showmatch.matchtime = 1 -- 対応する括弧やブレースを表示
--opt.guioptions:append({"a"})
-- クリップボード設定
opt.clipboard = "unnamedplus" -- yでコピーした時にクリップボードに入る
opt.showmatch = true -- 対応する括弧を強調表示
opt.swapfile = false -- スワップファイルを作成しない
opt.mouse = "a" -- マウス
opt.fenc = "utf-8" -- ファイルエンコーディング
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
-- tab時の見かけのスペース数
opt.tabstop = 2
-- 自動的に挿入される量
opt.shiftwidth = 2
-- インデント
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
-- 改行時にtabをスペースに変換
-- (インサート時に(Ctrl+v)+tabでtab挿入)
opt.expandtab = true
--行の改行を防ぐ
opt.linebreak = true
-- 制御文字を表示
-- opt.list = true
-- 制御文字をカスタマイズ
--[[
tab: タブ
trail: 行末（行最後の文字から改行まで）の半角スペース
eol: 改行
space: 半角スペース
extends: ウィンドウの幅が狭くて右に省略された文字がある記号
precedes: ウィンドウの幅が狭くて左に省略された文字がある記号
nbsp: 不可視のスペース]]
vim.opt.listchars = {
    -- tab = "▸▹┊",
    -- trail = "-",
    -- extends = "❯",
    -- precedes = "❮",
}
-- ノーマルモードから出るまでの時間を短縮
vim.opt.ttimeoutlen = 10
-- 改行時の自動コメントアウトを無効にする
opt.formatoptions:remove({ "r", "o" })
opt.formatoptions:append({ "M", "j" })
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
--vim.api.nvim_command "language messages en_US.UTF-8"
-- shadafileに書き込まない
vim.opt.shadafile = "NONE"
--fold
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 行を跨いで移動出来る様にする
opt.whichwrap = "b,s,h,l,[,],<,>,~"
