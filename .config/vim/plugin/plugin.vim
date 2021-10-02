" Plugin Management
function DownloadPlug()
    let data_dir = has('nvim') ? stdpath('data') . '/site' : "${XDG_DATA_HOME}/vim"
    if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      PlugInstall --sync | source $MYVIMRC
    endif
endfunction

call plug#begin($XDG_DATA_HOME."/vim/plugged")
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    source $XDG_CONFIG_HOME/vim/plugin/development.vim
call plug#end()

" Plugin Keybindings

" fzf
nmap <leader>F :GFiles<cr>
nmap <leader>f :Files<cr>

nnoremap <leader>cc :ChecklistToggleCheckbox<cr>
