" gitcommitのスペルcheck自動有効化
augroup GitSpellCheck
autocmd!
autocmd FileType gitcommit setlocal spell
augroup END