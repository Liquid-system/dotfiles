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

