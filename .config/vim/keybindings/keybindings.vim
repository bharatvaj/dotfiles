" General keybindings
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>p :Rg<cr>
nnoremap <leader>f :find 
nnoremap <Leader>l :ls<CR>:b<space>
nmap <leader>F :GFiles<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>g :grep 
nnoremap Y y$

function! ToggleList()
	if &list == "nolist"
		set list
	else
		set nolist
	endif
endfunction

nnoremap <leader>tl :call ToggleList()<CR>

" Buffer Creation
nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

" Quick save and write
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>qq :q<cr>

" Run Make
nnoremap <leader>bb :make<CR>

" Generate ctags
map <leader>c :!ctags -R -f ./.git/tags .<CR>

nnoremap <CR> :noh<CR><CR>:<backspace>

" Plugin keybindings
source ~/.config/vim/keybindings/vimspector.vim
source ~/.config/vim/keybindings/markdown.vim

" Development keybindings
" TODO Have a default build hotkey keybinding, maybe bb,br?
" And make it based on the project
" Make it as a filetype plugin. This should cover most cases.
nnoremap <leader>cb :Cargo build<cr>
nnoremap <leader>cr :Cargo run<cr>
