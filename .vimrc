" Handle missing XDG_s gracefully
if !exists("$XDG_HOME")
    let $XDG_HOME = has("win32") ? expand("$USERPROFILE") : expand("$HOME")
endif
if !exists("$XDG_DATA_HOME") | let $XDG_DATA_HOME=expand("$XDG_HOME/.local/share") | endif
if !exists("$XDG_CACHE_HOME") | let $XDG_CACHE_HOME=expand("$XDG_HOME/.cache") | endif

if !exists("$VIM") | let $VIM=expand("$XDG_DATA_HOME/vim") | endif

if has("&viminfofile") | set viminfofile=$XDG_CACHE_HOME/vim/viminfo | endif

set rtp+=C:/Users/bhara/.local/share/vim

filetype plugin indent on
syntax on

set packpath^=$XDG_DATA_HOME/vim

source $XDG_DATA_HOME/vim/keybindings.vim
source $XDG_DATA_HOME/vim/hyper-red.vim

let g:birck_default_chan="irc.libera.chat"

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
let g:netrw_dirhistmax = 0
let g:netrw_preview = 1
let g:netrw_winsize = 30

set updatetime=100


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

set synmaxcol=128

let g:netrw_home = $XDG_DATA_HOME . "/vim"
call mkdir($XDG_DATA_HOME . "/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')

function! s:load_plugins(t) abort
	packadd vim-commentary
	packadd vim-surround
	packadd vim-ninja-feet
	packadd vim-fugitive
	packadd vim-unimpaired
	packadd vim-better-whitespace
	packadd vim-dispatch
	packadd ctrlp.vim
    packadd conflict-marker.vim
    packadd mru

    call s:plugin_post_conf()
endfunction


func! s:plugin_post_conf()
    let g:ctrlp_by_filename = 1
    let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'

    let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
            \'PrtSelectMove("k")':   ['<c-p>', '<up>'], 
            \ 'PrtHistory(-1)':       ['<c-j>'],
            \ 'PrtHistory(1)':        ['<c-k>'],
            \ }

    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif

    packadd termdebug
    let g:termdebug_wide=163

    if !has("win32")
        packadd vim-tmux-navigator
        packadd notmuch-vim
        let g:notmuch_use_fzf = 1
        let g:notmuch_open_command = 'fzf'
        let g:notmuch_fzf_command = 'fzf --reverse'
        let g:notmuch_use_conversation_view = 1
        let sendmail_path = systemlist('sed -n "s/^set sendmail=\(.*\)$/\1/p; $!d" ~/.mailrc')
        if len(sendmail_path) > 0
            let g:notmuch_sendmail=sendmail_path[]
        endif
    endif

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
endfunc

aug user_cmds
	au!
	au VimEnter * call timer_start(20, function('s:load_plugins'))
aug END

source $XDG_DATA_HOME/vim/plugin.vim

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
endif

if has("win32")
	set shell=cmd
	set shellquote=\" 
	" shellxquote must be a literal space character.
	set shellxquote=  
else
	set shell=sh
endif

source $XDG_DATA_HOME/vim/hyper-red.vim

let g:table_mode_toggle_map = 'mm'
let g:table_mode_corner='|'

if !exists('g:undotree_WindowLayout')
	let g:undotree_WindowLayout = 4
	let g:undotree_ShortIndicators = 1
endif

