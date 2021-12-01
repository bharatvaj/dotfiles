" General keybindings
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>p :Rg<cr>
nnoremap <leader>f :find 

" Buffer Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer Creation
nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

" Quick save and write
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>q :q<cr>

" Plugin keybindings
source $XDG_CONFIG_HOME/vim/keybindings/vimspector.vim
source $XDG_CONFIG_HOME/vim/keybindings/markdown.vim

" Development keybindings
source $XDG_CONFIG_HOME/vim/keybindings/rust.vim
