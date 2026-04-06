" Handle missing XDGs gracefully
let $vconfig = expand((empty($XDG_CONFIG_HOME) ? "~/.config"       : "$XDG_CONFIG_HOME")  . "/vim")
let $vcache = expand((empty($XDG_CACHE_HOME) ? "~/.cache"       : "$XDG_CACHE_HOME")  . "/vim")
let $vdata  = expand((empty($XDG_DATA_HOME)  ? "~/.local/share" : "$XDG_DATA_HOME")   . "/vim")
let $vstate = expand((empty($XDG_STATE_HOME) ? "~/.local/state" : "$XDG_STATE_HOME")  . "/vim")

if isdirectory($vstate)
	set viminfofile=$vstate/viminfo
	set backupdir=$vstate/backup
	set directory=$vstate/swap
	set undodir=$vstate/undo
	set viewdir=$vstate/view
	let g:netrw_home = expand($vstate . "/netrw")
endif

if isdirectory($vdata)
	set packpath+=$vdata
	set rtp+=$vdata
endif

if isdirectory($vconfig)
	set rtp+=$vconfig
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
set wrap

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
		set guifont=FixedSys:h14:cANSI:qDRAFT
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
	set shell=cmd.exe
	aug scriptingshellslash
		au FileType dosbatch,ps1 set noshellslash
	aug END
	set guicursor=a:blinkon0
endif

if &term =~ 'xterm' || &term == 'win32'
	" Use DECSCUSR escape sequences
	let &t_SI = "\e[6 q"    " blink bar
	let &t_SR = "\e[4 q"    " blink underline
	let &t_EI = "\e[2 q"    " blink block
	let &t_ti ..= "\e[2 q"   " blink block
	let &t_te .= "\e[0 q"   " default (depends on terminal, normally blink block)
endif

