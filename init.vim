set inccommand=split
set number
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

" 印字不可能文字を16進数で表示
set display=uhex
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
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
" 中央に持っていく
nnoremap n zz
" タブの移動
tabnext
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprevious<CR>
"terminal設定
tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 8 | terminal <args>
" 常にインサートモードでterminalを開く
autocmd TermOpen * startinsert
let g:vimsyn_embed = 'l'
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
" カラースキーム
call dein#add('joshdick/onedark.vim')
call dein#add('wadackel/vim-dogrun')
call dein#add('mhartington/oceanic-next')
call dein#add('tomasiser/vim-code-dark')
call dein#add('bluz71/vim-nightfly-guicolors')
call dein#add("rafamadriz/neon")
call dein#add('morhetz/gruvbox')
call dein#add('folke/tokyonight.nvim')
" Required

call dein#end()

" vimsandwitch
runtime macros/sandwich/keymap/surround.vim
" easymotion
map f <Plug>(easymotion-bd-fl)
map t <Plug>(easymotion-bd-tl)
" s{char}{char} to move to {char}{char}
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

" smartcase
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

"typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
" rainbow
let g:rainbow_active = 1
" emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<Leader>'
autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {
\  'variables' : {
\    'lang' : "ja"
\  },
\  'indentation' : '  ',
\  'html' : {
\    'snippets' : {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<title></title>\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>",
\    }
\  }
\}
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
nnoremap <silent> <Leader>n :Fern . -drawer -reveal=% -width=23 -toggle<CR>

augroup my-glyph-palette
autocmd! *
autocmd FileType fern call glyph_palette#apply()
autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"リサイズ設定
let g:winresizer_start_key ='<C-s>'
let g:winresizer_vert_resize = 1

" lightline
set laststatus=2
let g:lightline = {
	\ 'colorscheme':'dogrun',
	\ 'mode_map': {'c': 'NORMAL'},
	\ 'active': {
	\   'left': [ ['mode','paste' ],['readonly','fugitive','filename'],['method']],
	\   'right':[['percent'],['fileformat'],['fileencoding'],['filetype']]
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
let g:vista_sidebar_width = 30
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
" lua設定
lua << EOF

vim.g.neon_style = "default"
vim.g.neon_italic_comment = false
vim.g.neon_italic_keyword = false
vim.g.neon_italic_function = false
vim.g.neon_transparent = true
vim.cmd[[colorscheme neon]]
vim.cmd 'set termguicolors'
vim.cmd 'syntax on'
-- lsp_installer.on_server_readyに追加
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format{async=true}<CR>', opts)
end
local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

local node_root_dir = nvim_lsp.util.root_pattern("package.json", "node_modules")
local buf_name = vim.api.nvim_buf_get_name(0)
local current_buf = vim.api.nvim_get_current_buf()
local is_node_repo = node_root_dir(buf_name, current_buf) ~= nil

lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = on_attach
  if server.name == "tsserver" or server.name == "eslint" then
	opts.autostart = is_node_repo
  elseif server.name == "denols" then
	opts.autostart = not(is_node_repo)
	opts.init_options = { lint=true, unstable=true }
  end
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

nvim_lsp.denols.setup{
  root_dir = nvim_lsp.util.root_pattern("deno.json")
}
-- Completion Setup--
local lspkind = require('lspkind')
local cmp = require 'cmp'
cmp.setup {
  snippet = { expand = function() end},
  formatting = {
	format = lspkind.cmp_format({
	  mode = 'symbol',
	  maxwidth = 50,
	  before = function (entry, vim_item)
		return vim_item
	  end
	})
  },
  mapping = {
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm {
	  select = true,
	},
	['<C-j>'] = function(fallback)
	  if cmp.visible() then
		cmp.select_next_item()
	  elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	  else
		fallback()
	  end
	end,
	['<C-k>'] = function(fallback)
	  if cmp.visible() then
		cmp.select_prev_item()
	  elseif luasnip.expand_or_jumpable(-1) then
		luasnip.expand_or_jump()
	  else
		fallback()
	  end
	end,
  },
  sources = {
	{ name = 'nvim_lsp' },
	{ name = 'luasnip' },
	{ name = 'nvim_lsp_signature_help' },
	{name = 'nvim_lua'}
  }
}
require'lspconfig'.sumneko_lua.setup {
settings = {
  Lua = {
	runtime = {
	  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	  version = 'LuaJIT',
	},
	diagnostics = {
	  -- Get the language server to recognize the `vim` global
	  globals = {'vim'},
	},
	workspace = {
	  -- Make the server aware of Neovim runtime files
	  library = vim.api.nvim_get_runtime_file("", true),
	},
	-- Do not send telemetry data containing a randomized but unique identifier
	telemetry = {
	  enable = false,
	},
  },
},
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
