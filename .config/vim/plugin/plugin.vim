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
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tommcdo/vim-ninja-feet'
	Plug 'ap/vim-css-color'
	Plug 'wellle/context.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-xmlattr'
	Plug 'msanders/snipmate.vim'
	Plug 'sainnhe/gruvbox-material'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'lpinilla/vim-codepainter'
	Plug '907th/vim-auto-save'
    source $XDG_CONFIG_HOME/vim/plugin/development.vim
call plug#end()

" Enable auto save only if backups are disabled
if exists("nowb")
	let g:auto_save = 1
endif

" Plugin Keybindings
nnoremap <leader>cc :ChecklistToggleCheckbox<cr>
