set number
set title
" 検索時の強調表示
set inccommand=split
" カラースキーム
set termguicolors
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" yでコピーした時にクリップボードに入る
set guioptions+=a
" クリップボード設定
set clipboard=unnamed
" 対応する括弧を強調表示
set showmatch
" スワップファイルを作成しない
set noswapfile
" 改行時の自動コメントアウトを無効にする
set formatoptions-=ro
" マウス
set mouse=a
" ファイルエンコーディング
set fenc=utf-8
set encoding=utf-8
set fileformats=unix,dos,mac
" スペースの追加
set virtualedit=onemore
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト非表示
set hlsearch
""ESC キーを押したら消えるようにする
nnoremap <silent><ESC><ESC> :nohl<CR>
" 括弧をハイライト表示
set showmatch
" 括弧秒数を調整
set matchtime=1
" tabで補完
set nocompatible
" コマンドラインの補完
set wildmode=list:longest
" vimからファイルを開くときにタブを表示する
set wildmenu wildmode=list:full
" キーの待ち時間設定
set timeoutlen=250
" 空白をスペース2文分にする
set shiftwidth=2
" タブを2文字分にする
set tabstop=2
"インデント
set cindent
set autoindent
"コードの色分け
syntax on
" ファイルタイプ検出を有効にする
filetype on
" クリップボード
set clipboard=unnamed
