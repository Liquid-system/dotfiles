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
opt.clipboard = "unnamed"
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
-- スペースの追加
opt.virtualedit = "onemore"
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
-- 空白をスペース2文分にする
opt.shiftwidth = 2
-- タブを2文字分にする
opt.tabstop = 2
-- インデント
opt.cindent = true
opt.autoindent = true
-- ファイルタイプ検出を有効にする
--opt.filetype=true
-- クリップボード
opt.clipboard = "unnamed"

-- 折り畳みを有効
opt.wrap = true
-- 短形選択で自由に移動する
opt.virtualedit = "all"
-- -エラー時の音を画面表示に
opt.visualbell = true
opt.wildignore =
'.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
opt.encoding = 'utf-8'
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.mouse = 'nv'
-- 英語表示
vim.api.nvim_command('language messages C')