func! WhatHlCursor()
    let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunc


func! TryAndDelete()
    try
        source %
        bdelete
    catch
        echoe "Cannot source file '" .. expand('<afile>') .. "'"
    endt
endfunc

func! OpenOnce(fi)
    :exec "vsplit" a:fi
    aug EphemeralBuffer
        au!
        au! BufWritePost <buffer> bdelete
    aug END
endfunc

func! OpenFile(fi)
    :exec "vsplit" a:fi
    aug EphemeralBuffer
        au! | au! BufWritePost <buffer> call TryAndDelete()
    aug END
endfunc

nnoremap <leader>ec :call OpenFile("$XDG_HOME/.vimrc")<cr>
nnoremap <leader>ek :call OpenFile("$XDG_DATA_HOME/vim/keybindings.vim")<cr>

" Read variable into the current buffer
"
" :put =&rtp
