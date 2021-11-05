autocmd FileType markdown set cursorline

" Hide and format markdown elements like **bold**
autocmd FileType markdown set conceallevel=2

function QuickUnderline(n)
	if a:n == 1
		normal! yypv$r=
	else
		normal! yypv$r-
	endif
endfunction
