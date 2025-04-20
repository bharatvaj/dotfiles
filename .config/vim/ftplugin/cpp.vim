augroup CppIAbbrevs
	autocmd!
	autocmd FileType c,cpp :iabbrev main@ int main(int argc, char* argv[]) {<cr><cr>}<up>
	autocmd FileType c,cpp :iabbrev f@ <esc>bvedivoid <C-o>P() {<cr><cr>}<up>
	autocmd FileType c,cpp :iabbrev p@ printf("\n");<esc>4hi
	autocmd FileType c,cpp :iabbrev r@ return;<left>
	autocmd FileType c,cpp :iabbrev i@ #include <><left>
	autocmd FileType c,cpp :iabbrev l@ <esc>Bvedifor(int <c-o>P=0; <c-o>P < n; <c-o>P++) {<cr><cr>}<up>
augroup END

