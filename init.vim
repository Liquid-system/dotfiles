if has('vim_starting')
" 挿入モード時に非点滅の縦棒タイプのカーソル
let &t_SI .= "\e[6 q"
" ノーマルモード時に非点滅のブロックタイプのカーソル
let &t_EI .= "\e[2 q"
" 置換モード時に非点滅の下線タイプのカーソル
let &t_SR .= "\e[4 q"
endif
if has('nvim')
" 置換の時の設定
set inccommand=split
endif
set number
set title
syntax on
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
" 検索語をハイライト表示
set hlsearch
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
" インサートモード中でも移動する
imap <C-h> <Left>
imap <C-l> <Right>
" ヤンクした内容が上書きされないようにする
noremap PP "0p
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
" 半画面上下
nnoremap <Leader>u <C-u> 
nnoremap <Leader>d <C-d>
" 一行のみコマンドの実行
nnoremap <Leader>i :!
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
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
" カーソルを中央に持っていく
nnoremap n zz
" タブの移動
tabnext
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprevious<CR>

" dein
" Quick start
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
if !has('nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here like this:
call dein#add('vim-jp/vimdoc-ja')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-surround')
call dein#add('easymotion/vim-easymotion')
call dein#add('preservim/nerdcommenter')
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('luochen1990/rainbow')
call dein#add('jiangmiao/auto-pairs')
call dein#add('lambdalisue/nerdfont.vim')
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
call dein#add('lambdalisue/fern.vim')
call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
call dein#add('lambdalisue/glyph-palette.vim')
call dein#add('lambdalisue/fern-hijack.vim')
call dein#add('psf/black')
call dein#add('rhysd/vim-clang-format')
call dein#add('kana/vim-operator-user')
call dein#add('prettier/vim-prettier', {'build': 'npm install'})
call dein#add('rhysd/devdocs.vim')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('vim-test/vim-test')
call dein#add('liuchengxu/vista.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
" カラースキーム
call dein#add('joshdick/onedark.vim')
call dein#add('wadackel/vim-dogrun')
call dein#add('mhartington/oceanic-next')
call dein#add('tomasiser/vim-code-dark')
call dein#add("rafamadriz/neon")
" Required

call dein#end()

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

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" フォーマッタ
nnoremap <buffer><silent><Leader>lf :LspDocumentFormat<CR>

" map to <Leader>f in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><silent><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><silent><Leader>f :ClangFormat<CR>
let g:clang_format#style_options = {
\ "BasedOnStyle" : "Google",
\ "AccessModifierOffset" : -4,
\ "AllowShortIfStatementsOnASingleLine" : "true",
\ "IndentWidth": 4}

" python3
autocmd FileType python nnoremap <buffer><silent><Leader>f :Black<CR>
autocmd FileType python vnoremap <buffer><silent><Leader>f :Black<CR>

" javascript
autocmd FileType javascript nnoremap <buffer><silent><Leader>f :PrettierAsync<CR>
autocmd FileType javascript vnoremap <buffer><silent><Leader>f :PrettierAsync<CR>
"typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
" rainbow
let g:rainbow_active = 1
"Fern
let g:fern#renderer#default#leading = "│"
let g:fern#renderer#default#root_symbol = "┬ "
let g:fern#renderer#default#leaf_symbol = "├─ "
let g:fern#renderer#default#collapsed_symbol = "├─ "
let g:fern#renderer#default#expanded_symbol = "├┬ "
let g:fern#renderer = "nerdfont"
function! s:init_fern() abort
nmap <buffer><expr>
  \ <Plug>(fern-my-expand-or-collapse)
  \ fern#smart#leaf(
  \   "\<Plug>(fern-action-collapse)",
  \   "\<Plug>(fern-action-expand)",
  \   "\<Plug>(fern-action-collapse)",
  \ )
nmap <buffer><expr>
	\ <Plug>(fern-my-expand-or-enter)
	\ fern#smart#drawer(
	\   "\<Plug>(fern-open-or-expand)",
	\   "\<Plug>(fern-open-or-enter)",
	\ )
nmap <buffer><expr>
	\ <Plug>(fern-my-collapse-or-leave)
	\ fern#smart#drawer(
	\   "\<Plug>(fern-action-collapse)",
	\   "\<Plug>(fern-action-leave)",
	\ )
nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
nmap <buffer><nowait> l <Plug>(fern-my-expand-or-enter)
nmap <buffer><nowait> h <Plug>(fern-my-collapse-or-leave)
endfunction

function! s:fern_preview_init() abort
nmap <buffer><expr>
  \ <Plug>(fern-my-preview-or-nop)
  \ fern#smart#leaf(
  \   "\<Plug>(fern-action-open:edit)\<C-w>p",
  \   "",
  \ )
nmap <buffer><expr> j
  \ fern#smart#drawer(
  \   "j\<Plug>(fern-my-preview-or-nop)",
  \   "j",
  \ )
nmap <buffer><expr> k
  \ fern#smart#drawer(
  \   "k\<Plug>(fern-my-preview-or-nop)",
  \   "k",
  \ )
endfunction

augroup my-fern-preview
autocmd! *
autocmd FileType fern call s:fern_preview_init()
augroup END

" You need this otherwise you cannot switch modified buffer
set hidden
" 隠しファイルを表示する
let g:fern#default_hidden=1

nnoremap <silent> <C-n> :Fern . -drawer -reveal=% -width=17 -toggle<CR>
nnoremap <silent> <Leader>n :Fern . -drawer -reveal=% -width=17 -toggle<CR>

augroup my-glyph-palette
autocmd! *
autocmd FileType fern call glyph_palette#apply()
autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END


"lsp
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"Use <C-j> and <C-k> to navigate the completion list:
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr>;; coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
						  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent><Leader>q <Plug>(coc-definition)
nmap <silent><Leader>y <Plug>(coc-type-definition)

" Use K to show documentation in preview window.
nnoremap <silent>K :call <SID>show_documentation()<CR>
j
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
elseif (coc#rpc#ready())
call CocActionAsync('doHover')
else
execute '!' . &keywordprg . " " . expand('<cword>')
endif
endfunction

"エラージャンプ
nmap <silent><Leader>ej <Plug>(coc-diagnostic-next-error)
nmap <silent><Leader>ek <Plug>(coc-diagnostic-prev-error)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" lightline
set laststatus=2
let g:lightline = {
	\ 'colorscheme':'dogrun',
	\ 'mode_map': {'c': 'NORMAL'},
	\ 'active': {
	\   'left': [ ['mode','paste' ],['readonly','fugitive','filename'],['method']],
	\   'right':[['percent'],['fileformat'],['fileencoding'],['filetype'],['cocstatus']]
	\ },
	\ 'component_function': {
	\   'modified': 'LightlineModified',
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive',
	\   'filename': 'LightlineFilename',
	\   'fileformat': 'LightlineFileformat',
	\   'filetype': 'LightlineFiletype',
	\   'fileencoding': 'LightlineFileencoding',
	\   'mode': 'LightlineMode', 
	\   'method': 'NearestMethodOrFunction',
	\   'cocstatus': 'coc#status'
	\ }
	\ }

function! LightlineModified()
return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
	\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
	\  &ft == 'unite' ? unite#get_status_string() :
	\  &ft == 'vimshell' ? vimshell#get_status_string() :
	\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
	\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
return fugitive#head()
else
return ''
endif
endfunction

function! LightlineFileformat()
return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! NearestMethodOrFunction() abort
return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" ctags
nnoremap <silent><Leader>v :Vista!!<CR>
let g:vista_sidebar_width = 38
" How each level is indented and what to prepend.g:vista#renderer#ctags
" This could make the display more compact or more spacious.
let g:vista#renderer#ctags = "kind"
let g:vista_echo_cursor = 0
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" Required:
filetype plugin indent on

" Needcommenter
let g:NERDDefaultAlign='left'
let g:NERDCreateDefaultMappings = 0
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle
nmap <Leader>a <Plug>NERDCommenterAppend

" devdocs.vim
nmap <Leader>K <Plug>(devdocs-under-cursor)
" treesitter設定
lua <<EOF
require'nvim-treesitter.configs'.setup {
highlight = {
  enable = true,  -- syntax highlightを有効にする
},
ensure_installed = 'maintained' 
}
EOF
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

" gitcommitのスペルcheck自動有効化
augroup GitSpellCheck
autocmd!
autocmd FileType gitcommit setlocal spell
augroup END
" colorscheme
syntax enable
colorscheme neon

" 自動リムーブ
call map(dein#check_clean(), "delete(v:val, 'rf')")
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
call map(s:removed_plugins, "delete(v:val, 'rf')")
call dein#recache_runtimepath()
endif
" If you want to install not installed plugins on startup.
let g:dein#auto_recache = 1
if dein#check_install()
call dein#install()
endif
