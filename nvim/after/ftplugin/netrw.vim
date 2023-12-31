let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
let g:netrw_liststyle = 3
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
nmap <buffer> l <CR>
nmap <buffer> h -
let g:NetrwIsOpen=0
function! ToggleNetrw()
  if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction

noremap <silent><Leader>n :call ToggleNetrw()<CR>