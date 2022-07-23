function! ToggleList()
	if &list == "nolist"
		set list
	else
		set nolist
	endif
endfunction

function! FileMvHelper()
	:normal! 0i"A"0y$A p0imv j0
endfunction
" Run Make

function SaveAndBuild()
		wall
		Make
endfunction

" TODO load this automatically
source $XDG_CONFIG_HOME/vim/ftplugin/cpp.vim
