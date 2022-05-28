set number
set inccommand=split
set title
set encoding=utf-8
scriptencoding utf-8
inoremap <silent> jj <ESC>
" 表示行と論理行を入れ替える
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" ビジュアルモードで < > キーによるインデント後にビジュアルモードが解除されないようにする
vnoremap < <gv
vnoremap > >gv
" leaderキーの設定
let mapleader = "\<space>"
" 英語表示
language messages C
" カラースキーム
set termguicolors
"コードの色分け
syntax on
" ファイルタイプ検出を有効にする
filetype on
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
" 空白をスペース4文分にする
set shiftwidth=4
" タブを4文字分にする
set tabstop=4
"インデント
set cindent
set autoindent
" インサートモード中でも移動する
imap <C-h> <Left>
imap <C-l> <Right>
" ヤンクした内容が上書きされないようにする
noremap PP "0p
" コマンドで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x
" コピペ時の自動インデント
nnoremap p ]p
nnoremap P ]P
nnoremap ]p p
nnoremap ]P P
" 半画面上下
nnoremap <Leader>u <C-u>
nnoremap <Leader>d <C-d>
" terminalの起動
nnoremap <Leader>s :T <CR>
" クリップボード
if has('nvim')
set clipboard=unnamed
else
set clipboard=unnamed,autoselect
endif
" 編集箇所のカーソルを記憶
if has("autocmd")
augroup redhat
" In text files, always limit the width of text to 78 characters
autocmd BufRead *.txt set tw=78
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
augroup END
endif

" 画面間でのカーソルの移動
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
" 中央に持っていく
nnoremap n zz
" タブの移動
tabnext
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprevious<CR>

" dein
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('vim-jp/vimdoc-ja')
call dein#add('itchyny/lightline.vim')
call dein#add('machakann/vim-sandwich')
call dein#add('lukas-reineke/indent-blankline.nvim')
call dein#add('easymotion/vim-easymotion')
call dein#add('matze/vim-move')
call dein#add('preservim/nerdcommenter')
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('neovim/nvim-lspconfig')
call dein#add('williamboman/nvim-lsp-installer')
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-path')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('hrsh7th/cmp-nvim-lsp-signature-help')
call dein#add('hrsh7th/cmp-nvim-lua')
call dein#add('onsails/lspkind.nvim')
call dein#add('mortepau/codicons.nvim')
call dein#add('luochen1990/rainbow')
call dein#add('jiangmiao/auto-pairs')
call dein#add('lambdalisue/nerdfont.vim')
call dein#add('mattn/emmet-vim')
call dein#add('simeji/winresizer')
call dein#add('lambdalisue/fern.vim')
call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
call dein#add('lambdalisue/glyph-palette.vim')
call dein#add('lambdalisue/fern-hijack.vim')
call dein#add('rhysd/devdocs.vim')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('liuchengxu/vista.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('numToStr/FTerm.nvim')
call dein#add('psf/black',{'on_ft':'python'})
" カラースキーム
call dein#add('joshdick/onedark.vim')
call dein#add('wadackel/vim-dogrun')
call dein#add('mhartington/oceanic-next')
call dein#add('tomasiser/vim-code-dark')
call dein#add('bluz71/vim-nightfly-guicolors')
call dein#add("rafamadriz/neon")
call dein#add('morhetz/gruvbox')
call dein#add('folke/tokyonight.nvim')

call dein#end()

" If you want to install not installed plugins on startup.
let g:dein#auto_recache = 1
if dein#check_install()
call dein#install()
endif

" Required:
filetype plugin indent on
" colorscheme
syntax enable
" ファイルの読み込み
runtime! configs/*.vim
"typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript

" lua設定
lua << EOF
require('index')
EOF

" 自動リムーブ
call map(dein#check_clean(), "delete(v:val, 'rf')")
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
call map(s:removed_plugins, "delete(v:val, 'rf')")
call dein#recache_runtimepath()
endif
