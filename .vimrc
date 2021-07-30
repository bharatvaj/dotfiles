set number
set mouse=a
syntax on
set exrc

" Search
set hlsearch
set incsearch

" Anti-tab
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Netrw customization
let g:netrw_banner = 0


" Plugin Management
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'cdelledonne/vim-cmake'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'lifepillar/vim-solarized8'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
call plug#end()


" Plugin Keybindings
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nnoremap <leader>t :tabnew<cr>

" Theming
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

