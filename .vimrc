syntax on indent off
if has("&viminfofile")
    set viminfofile=$XDG_CACHE_DIR/vim/viminfo
endif

" reject netrw, embrace ls
"let loaded_netrwPlugin = 1

set complete-=i
set foldmethod=marker
set foldmarker={,}
set foldlevel=20
set foldopen-=search

" General
set nocompatible
set mouse=
set cursorline
if has('cursorlineopt')
	set cursorlineopt=number
endif
set exrc

" Turn backup off
set nobackup
set nowb
set noswapfile

" Map leader to space
nnoremap <space> <Nop>
let mapleader = " "

" Enable hidden buffers
set hidden

" Disable auto fixing end of line
" Useful when opening binary files
set nofixendofline

" Disable vim intro message
set shortmess=Iat
set shortmess-=F

" Search
set hlsearch
set incsearch
set nowrapscan

" Pro tab
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Netrw customization
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_fastbrowse= 2

" Disable status
set laststatus=1

set nolazyredraw
set ttyfast
set nospell


" Common vimrc
source $XDG_DATA_HOME/vim/vimrc

source $XDG_DATA_HOME/vim/keybindings.vim

set packpath^=$XDG_DATA_HOME/vim

function! FZYFiles() abort
    let l:tempname = tempname()
    " fzf | awk '{ print $1":1:0" }' > file
    execute 'silent !git ls-files --recurse-submodules | fzy > ' . fnameescape(l:tempname)
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

function! s:load_plugins(t) abort
	set synmaxcol=128
	" Use XDG Paths for vim
	" TODO compile hard constants somewhere based on OS
	set runtimepath^='$XDG_CONFIG_HOME/vim'
	set runtimepath+='$XDG_DATA_HOME/vim'
	set runtimepath+='$XDG_CONFIG_HOME/vim/after'

	let g:netrw_home = $XDG_DATA_HOME . "/vim"
	call mkdir($XDG_DATA_HOME . "/vim/spell", 'p')
	set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')

	set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
	set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
	set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')
	packadd vim-tmux-navigator
	packadd vim-commentary
	packadd vim-surround
	packadd vim-ninja-feet
	packadd vim-fugitive
	packadd vim-unimpaired
	packadd vim-better-whitespace
	packadd notmuch-vim
	packadd vim-dispatch
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

if has("gui")
	source $XDG_CONFIG_HOME/vim/gvimrc
endif

if has("win32")
set shell=cmd
	set shellquote=\" 
	" shellxquote must be a literal space character.
	set shellxquote=  
else
    set shell=sh
endif

" Move to a file common to nvim and vim
function! ToggleList()
	if &list == "nolist"
		set list
	else
		set nolist
	endif
endfunction

function! ToggleBackground()
	if &background == "light"
		set background=dark
	else
		set background=light
	endif
endfunction

function! FileMvHelper()
	:normal! 0i"A"0y$A p0imv j0
endfunction
" Run Make

function SaveAndBuild()
		wall
		Make
endfunction

function QuickUnderline(n)
	if a:n == 1
		normal! yypv$r=
	else
		normal! yypv$r-
	endif
endfunction

function ReverseDate()
	normal! dt/wwpldeBP
endfunction


" TODO load this automatically
source $XDG_CONFIG_HOME/vim/ftplugin/cpp.vim

let g:birck_default_chan="irc.libera.chat"

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu-mac -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

" find file in git repo
function! ChooseFile()
  let dir = expand("%:h")
  if empty(dir) | let dir = getcwd() | endif

  let root = system("cd " . dir . " && git rev-parse --show-toplevel")
  if v:shell_error != 0 | echo "Not in a git repo" | return | endif
  let root = root[0:-2]

  let selection = system("cd " . root . " && git ls-files -co --exclude-standard | choose")
  if empty(selection) | echo "Canceled" | return | end

  echo "Finding file..."
  exec ":e " . root . "/" . selection
endfunction

function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

