if system('uname -a | grep microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif


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
