"Fern
let g:fern#renderer#default#leading = "│"
let g:fern#renderer#default#root_symbol = "┬ "
let g:fern#renderer#default#leaf_symbol = "├─ "
let g:fern#renderer#default#collapsed_symbol = "├─ "
let g:fern#renderer#default#expanded_symbol = "├┬ "
let g:fern#renderer = "nerdfont"
" 隠しファイルを表示する
let g:fern#default_hidden=1
let g:fern#renderer#nerdfont#indent_markers = 1

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

" action
map <buffer> cd <Plug>(fern-action-cd)
map <buffer> mv <Plug>(fern-action-new-path)
map <buffer> Nf <Plug>(fern-action-new-file)
map <buffer> Nd <Plug>(fern-action-new-dir)

nnoremap <silent><Leader>n :Fern . -drawer -reveal=% -toggle<CR>

augroup my-glyph-palette
autocmd! *
autocmd FileType fern call glyph_palette#apply()
autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
