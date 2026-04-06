iabbrev main@ int main(int argc, char* argv[]) {<cr><cr>}<up>
iabbrev f@ <esc>bvedivoid <C-o>P() {<cr><cr>}<up>
iabbrev fi@ <esc>bvediint <C-o>P() {<cr><cr>}<up>
iabbrev p@ printf("\n");<esc>4hi
iabbrev r@ return;<left>
iabbrev i@ #include <><left>
iabbrev l@ <esc>Bvedifor(int <c-o>P=0; <c-o>P < n; <c-o>P++) {<cr><cr>}<up>

setlocal cindent
setlocal cinoptions=>4,n-2,{0,^-0,t0,f0,:=0,l1,g0

set formatprg=indent\ -kr\ -ppi\ 0\ -il\ 0\ -psl\ --use-tabs\ -ts4\ -br\ -brs\ -ce\ -cli0
