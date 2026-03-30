" Handle missing XDG_s gracefully
if isdirectory($XDG_CONFIG_HOME)
	let $vcache = expand((empty($XDG_CACHE_HOME) ? "~/.cache"       : "$XDG_CACHE_HOME")  . "/vim")
	let $vdata  = expand((empty($XDG_DATA_HOME)  ? "~/.local/share" : "$XDG_DATA_HOME")   . "/vim")
	let $vstate = expand((empty($XDG_STATE_HOME) ? "~/.local/state" : "$XDG_STATE_HOME")  . "/vim")


	set viminfofile=$vstate/viminfo
	if expand($XDG_HOME) == expand("~")
		set backupdir-=.
		set directory-=.
	else
		set backupdir=$vstate/backup
		set directory=$vstate/swap
	endif
	set undodir=$vstate/undo

	set viewdir=$vstate/view
	set rtp+=$vdata
	set packpath^=$vdata

	let g:netrw_home = expand($vstate . "/netrw")
endif

filetype plugin indent on
syntax on

" General
set ai
set exrc
set hidden
set lazyredraw
set mouse=
set nocompatible
set noexpandtab
set nofixendofline
set nosol
set scrolloff=0
set shortmess=Iat

if has("signs") | set signcolumn=yes | endif

" Turn backup off
"set nobackup
"set nowb
"set noswapfile

if v:version >= 901
	set cursorline
	set cursorlineopt=number
	set display=lastline
	set smoothscroll
endif

" Search
set hlsearch
set incsearch
set nowrapscan

set tabstop=4
set shiftwidth=4
set expandtab

" Disable status
set laststatus=1

set ttyfast
set nospell

" Netrw customization
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_fastbrowse= 2
let g:netrw_preview = 1
let g:netrw_winsize = 30

set updatetime=100


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"let g:loaded_vimballPlugin = 1
"let g:loaded_vimball = 1
"let g:loaded_getscriptPlugin = 1

let maplocalleader=" "
set complete-=i
set foldmethod=marker             
set foldmarker={,}
set foldlevel=20
set foldopen-=search


set synmaxcol=1000

if has("gui")
	set guioptions=
	set mouse=a
	if has("win32")
		set guifont=FixedSys:h11:cANSI:qDRAFT
	endif
    " TODO Implement fg or reverse <c-z>
    nnoremap <c-z> :term<cr><c-w>o
    inoremap <c-z> :term<cr><c-w>o
    tnoremap <c-z> <c-w>:hide edit #<cr>
else
    set termguicolors
    set background=dark
    colorscheme hyperred
endif

set shellslash

if has("win32")
	set shell=cmd
	set shellquote=\" 
    aug scriptingshellslash
        au FileType dosbatch,ps1 set noshellslash
    aug END
	" shellxquote must be a literal space character.
	set shellxquote=  
    set guicursor=a:blinkon0
else
	set shell=sh
endif

if &term =~ 'xterm' || &term == 'win32'
	" Use DECSCUSR escape sequences
	let &t_SI = "\e[6 q"    " blink bar
	let &t_SR = "\e[4 q"    " blink underline
	let &t_EI = "\e[2 q"    " blink block
	let &t_ti ..= "\e[2 q"   " blink block
	let &t_te .= "\e[0 q"   " default (depends on terminal, normally blink block)
endif

if isdirectory($XDG_CONFIG_HOME)
	source "$XDG_CONFIG_HOME/vim/plugin.vim"
	source "$XDG_CONFIG_HOME/vim/keybindings.vim"
endif

if filereadable("$XDG_CONFIG_HOME/vim/unstaged.vim")
	source "$XDG_CONFIG_HOME/vim/unstaged.vim"
endif
