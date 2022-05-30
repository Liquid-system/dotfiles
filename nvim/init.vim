" 英語表示
language messages C
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

" plug
" Required:
call jetpack#begin()
" Add or remove your plugins here like this:
call jetpack#add('tani/vim-jetpack')
call jetpack#add('vim-jp/vimdoc-ja')
call jetpack#add('itchyny/lightline.vim')
call jetpack#add('machakann/vim-sandwich')
call jetpack#add('lukas-reineke/indent-blankline.nvim')
call jetpack#add('easymotion/vim-easymotion')
call jetpack#add('matze/vim-move')
call jetpack#add('preservim/nerdcommenter')
call jetpack#add('nvim-treesitter/nvim-treesitter')
call jetpack#add('neovim/nvim-lspconfig')
call jetpack#add('williamboman/nvim-lsp-installer')
call jetpack#add('hrsh7th/cmp-nvim-lsp')
call jetpack#add('hrsh7th/cmp-buffer')
call jetpack#add('hrsh7th/cmp-path')
call jetpack#add('hrsh7th/nvim-cmp')
call jetpack#add('hrsh7th/cmp-nvim-lsp-signature-help')
call jetpack#add('hrsh7th/cmp-nvim-lua')
call jetpack#add('onsails/lspkind.nvim')
call jetpack#add('mortepau/codicons.nvim')
call jetpack#add('luochen1990/rainbow')
call jetpack#add('jiangmiao/auto-pairs')
call jetpack#add('lambdalisue/nerdfont.vim')
call jetpack#add('mattn/emmet-vim')
call jetpack#add('simeji/winresizer')
call jetpack#add('lambdalisue/fern.vim')
call jetpack#add('lambdalisue/fern-renderer-nerdfont.vim')
call jetpack#add('lambdalisue/glyph-palette.vim')
call jetpack#add('lambdalisue/fern-hijack.vim')
call jetpack#add('rhysd/devdocs.vim')
call jetpack#add('vim-scripts/vim-auto-save')
call jetpack#add('liuchengxu/vista.vim')
call jetpack#add('tpope/vim-fugitive')
call jetpack#add('junegunn/fzf')
call jetpack#add('numToStr/FTerm.nvim')
"フォーマッタ
call jetpack#add('psf/black')
" カラースキーム
call jetpack#add('joshdick/onedark.vim')
call jetpack#add('wadackel/vim-dogrun')
call jetpack#add('mhartington/oceanic-next')
call jetpack#add('tomasiser/vim-code-dark')
call jetpack#add('bluz71/vim-nightfly-guicolors')
call jetpack#add("rafamadriz/neon")
call jetpack#add('morhetz/gruvbox')
call jetpack#add('folke/tokyonight.nvim')

call jetpack#end()

" If you want to install not installed plugins on startup.
for name in jetpack#names()
if !jetpack#tap(name)
  call jetpack#sync()
  break
endif
endfor

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
