set number
inoremap <silent> jj <ESC>
set termguicolors

"logを見る:Profileコマンドの設定
command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/profile.txt
  profile func *
  profile file *
endfunction

" ファイルタイプ検出を有効にする
filetype on
set wildmenu
set wildmode=full
augroup vimrc
    " 以前の autocmd コマンドをクリア
    autocmd!

    " C/C++/Java 言語系のファイルタイプが設定されたら cindent モードを有効にする
    autocmd FileType c,cpp,java  setl cindent
    autocmd FileType c,cpp,java  setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround
augroup END

if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅縦棒タイプのカーソル
  let &t_EI .= "\e[6 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif

imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
set fenc=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
language messages C
set mouse=a
set virtualedit=onemore
if has('nvim')
  set clipboard=unnamed
else
  set clipboard=unnamed,autoselect
endif
set showmode
nnoremap gr :tabprevious
set wildmenu
set wildmode=full
set belloff=all
set ambiwidth=double


let g:python3_host_prog= '/usr/local/bin/python-3.9.6/bin/python3'
let g:python_host_prog='/usr/bin/python2'

"dein
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
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

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('itchyny/lightline.vim')
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('sheerun/vim-polyglot')
call dein#add('jiangmiao/auto-pairs')
call dein#add('lambdalisue/fern.vim')
call dein#add('lambdalisue/nerdfont.vim')
call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
call dein#add('lambdalisue/glyph-palette.vim')
call dein#add('lambdalisue/fern-hijack.vim')
call dein#add('cocopon/iceberg.vim')
call dein#add('arcticicestudio/nord-vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')
call dein#add('mattn/vim-lsp-settings')

colorscheme nord

" Required

call dein#end()

"fern
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden=1
nnoremap <silent> <Leader>ee :<C-u>Fern <C-r>=<SID>smart_path()<CR><CR>

"icon
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"lightline
set laststatus=2
let g:lightline = {
        \ 'colorscheme':'nord',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],[ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
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

nnoremap <silent> ls :Buffers<CR>

let g:dein#auto_recache = 1

" lsp
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_popup_delay = 200

let g:lsp_log_verbose = 1

autocmd BufWritePre <buffer> LspDocumentFormatSync

" Required:
filetype plugin indent on
syntax enable

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

if dein#check_install()
  call dein#install()
endif
