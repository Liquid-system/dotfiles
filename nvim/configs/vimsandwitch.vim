 " vimsandwitch
 "runtime macros/sandwich/keymap/surround.vim
if !empty(findfile('src/uncrustify.cfg', ';'))
 setlocal formatprg=uncrustify\ -q\ -l\ C\ -c\ src/uncrustify.cfg\ --no-backup
endif
