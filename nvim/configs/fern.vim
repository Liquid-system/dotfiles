"Fern
let g:fern#renderer#default#leading = "│"
let g:fern#renderer#default#root_symbol = "┬ "
let g:fern#renderer#default#leaf_symbol = "├─ "
let g:fern#renderer#default#collapsed_symbol = "├─ "
let g:fern#renderer#default#expanded_symbol = "├┬ "
let g:fern#renderer = "nerdfont"
let g:fern#previewmode=0

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

" 隠しファイルを表示する
let g:fern#default_hidden=1

nnoremap <silent><Leader>n :Fern . -drawer -reveal=% -width=23 -toggle<CR>

augroup my-glyph-palette
autocmd! *
autocmd FileType fern call glyph_palette#apply()
autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
