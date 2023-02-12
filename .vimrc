autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
set number
set title
set hidden
syntax on
filetype on
filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8
inoremap <silent> jj <ESC>
" 表示行を論理行に置き換える
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$
" ビジュアルモードで < > キーによるインデント後にビジュアルモードが解除されないようにする
vnoremap < <gv
vnoremap > >gv
 " leaderキーの設定
let mapleader = "\<space>"
" 英語表示
language messages C
set termguicolors
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" yでコピーした時にクリップボードに入る
set clipboard+=unnamed
set guioptions+=a
" 対応する括弧を強調表示
set showmatch
" スワップファイルを作成しない
set noswapfile
" 改行時の自動コメントアウトを無効にする
set formatoptions-=ro
set mouse=a
" バックスペース
set backspace=indent,eol,start
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
" 検索語をハイライト表示
set hlsearch
" tabで補完
set nocompatible
" コマンドラインの補完
set wildmode=list:longest
set wildmenu wildmode=list:full
" キーの待ち時間設定
set timeoutlen=250
" 空白をスペース4文分にする
set shiftwidth=4
" タブを4文字分にする
set tabstop=4
" 不要なコメント開始文字削除
" マルチバイト文字前後のスペース削除
set fo+=j
set fo+=M
" コマンドで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x
vnoremap df "_dd
nnoremap df "_dd
" コピペ時の自動インデント
nnoremap p ]p
nnoremap P ]P
nnoremap ]p p
nnoremap ]P P

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

" 不要なデフォルトプラグインの停止
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 2
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
" 画面間でのカーソルの移動
nnoremap <Leader>  <C-w>
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" プラグイン
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'vim-jp/vimdoc-ja'
Jetpack 'vim-airline/vim-airline'
Jetpack 'vim-airline/vim-airline-themes'
Jetpack 'tpope/vim-surround'
Jetpack 'easymotion/vim-easymotion'
Jetpack 'preservim/nerdcommenter'
Jetpack 'jiangmiao/auto-pairs'
Jetpack 'lambdalisue/nerdfont.vim'
Jetpack 'lambdalisue/fern.vim'
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
Jetpack 'lambdalisue/glyph-palette.vim'
Jetpack 'lambdalisue/fern-hijack.vim'
Jetpack 'vim-scripts/vim-auto-save'
Jetpack 'wadackel/vim-dogrun'
call jetpack#end()

" NerdCommenter
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0
let g:NERDCreateDefaultMappings = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterSexy
" easymotion
" s{char}{char} to move to {char}{char}
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

"Fern
nnoremap <silent> <Leader>n :Fern . -drawer -reveal=% -width=17 -toggle<CR>

let g:fern#default_hidden=1
let g:fern#renderer#default#leading = "│"
let g:fern#renderer#default#root_symbol = "┬ "
let g:fern#renderer#default#leaf_symbol = "├─ "
let g:fern#renderer#default#collapsed_symbol = "├─ "
let g:fern#renderer#default#expanded_symbol = "├┬ "
let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#indent_markers = 1
let g:fern#default_hidden=1
let g:fern#renderer#nerdfont#indent_markers = 1

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" lightline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save while in insert mode
let g:auto_save_silent = 1

" 自動保存の有効・無効の設定
function! s:auto_save_detect() abort
  " read onlyの場合は自動保存しない"
  " filenameがResultの場合は自動保存しない(dbext.vimで作られる一時ファイル)
  if &readonly || expand('%:t') ==# 'Result'
    let g:auto_save = 0 " 自動保存しない
  else
    let g:auto_save = 1 " 自動保存
  end
endfunction

augroup switch_auto_save
  autocmd!
  au BufEnter * call s:auto_save_detect()
augroup END

" colorscheme
syntax enable
colorscheme dogrun
