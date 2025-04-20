syntax on

" Handle XDG_ missing gracefully
if empty("$XDG_CACHE_HOME")
	let $XDG_CACHE_HOME=$HOME/.cache
endif
if has("&viminfofile")
    set viminfofile=$XDG_CACHE_HOME/vim/viminfo
endif

" General
set ai
set exrc
set hidden
set mouse=
set nocompatible
set noexpandtab
set nofixendofline
set shortmess=Iat

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

" Pro tab
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Disable status
set laststatus=1

set nolazyredraw
set ttyfast
set nospell

" Netrw customization
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_fastbrowse= 2
let g:netrw_preview = 1
let g:netrw_winsize = 20

source $XDG_DATA_HOME/vim/vimrc
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

let g:loaded_vimballPlugin = 1
let g:loaded_vimball = 1
let g:loaded_getscriptPlugin = 1

let maplocalleader=" "
set complete-=i
set foldmethod=marker
set foldmarker={,}
set foldlevel=20
set foldopen-=search

" Debug
let g:termdebug_config = {'sign': '>>', 'winbar': 0, 'wide':163}

function! FZYFiles() abort
	let l:tempname = tempname()
	" fzf | awk '{ print $1":1:0" }' > file
	execute 'silent !git ls-files --recurse-submodules | fzf > ' . fnameescape(l:tempname)
	let l:tcontents = join(readfile(l:tempname))
	try
		" TODO Add option to add multiple files to argslist
		"execute 'argadd ' . l:tcontents
		 let bufnr = bufadd(l:tcontents)
		call bufload(bufnr)
		"call setbufline(bufnr, 1, ['some', 'text'])
		execute 'edit ' . l:tcontents
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction

let g:lsc_server_commands = {'cpp': 'clangd --log=error'}
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

set synmaxcol=128
set runtimepath^='$XDG_CONFIG_HOME/vim'
set runtimepath+='$XDG_DATA_HOME/vim'
set runtimepath+='$XDG_CONFIG_HOME/vim/after'

let g:netrw_home = $XDG_DATA_HOME . "/vim"
call mkdir($XDG_DATA_HOME . "/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')

function! s:load_plugins(t) abort
	packadd vim-tmux-navigator
	packadd vim-commentary
	packadd vim-surround
	packadd vim-ninja-feet
	packadd vim-fugitive
	packadd vim-unimpaired
	packadd vim-better-whitespace
	packadd notmuch-vim
	packadd vim-dispatch
	packadd termdebug
	let g:termdebug_wide=163
	let g:notmuch_use_fzf = 1
	let g:notmuch_open_command = 'fzf'
	let g:notmuch_fzf_command = 'fzf --reverse'
	let g:notmuch_use_conversation_view = 1
	let sendmail_path = systemlist('sed -n "s/^set sendmail=\(.*\)$/\1/p; $!d" ~/.mailrc')
	if len(sendmail_path) > 0
		let g:notmuch_sendmail=sendmail_path[0]
	endif
endfunction
augroup user_cmds
	autocmd!
	autocmd VimEnter * call timer_start(20, function('s:load_plugins'))
augroup END

source $XDG_CONFIG_HOME/vim/ftplugin/cpp.vim
source $XDG_DATA_HOME/vim/plugin.vim

if has("gui")
	set guioptions=
	set mouse=a
	if has("win32")
		set guifont=FixedSys:h11:cANSI:qDRAFT
		colorscheme default
		set background=light
	endif
endif

if has("win32")
	set shell=cmd
	set shellquote=\" 
	" shellxquote must be a literal space character.
	set shellxquote=  
else
	set shell=sh
endif
