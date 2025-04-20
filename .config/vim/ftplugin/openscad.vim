augroup OpenscadIAbbrevs
	autocmd!
	autocmd FileType scad :iabbrev function@ function {<cr><cr>}<up>
	autocmd FileType scad :iabbrev fun@ <esc>bvedivoid <C-o>P() {<cr><cr>}<up>
	autocmd FileType scad :iabbrev p@ printf("\n");<esc>4hi
	autocmd FileType scad :iabbrev r@ return;<left>
	autocmd FileType scad :iabbrev i@ #include <><left>
	autocmd FileType scad :iabbrev for@ <esc>bvedifor(int <c-o>P=0; <c-o>P < n; <c-o>P++) {<cr><cr>}<up>
augroup END

