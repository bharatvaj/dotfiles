" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction


let g:fuzzer_exe="wlines.exe"
"let g:fuzzer_args="-i -l 20 "
let g:fuzzer_args=""
" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | " . g:fuzzer_exe." ".g:fuzzer_args))
  if empty(fname)
    return
  endif
  execute a:cmd." ".l:fname
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
    botright copen
	wall
	if exists(":Make")
		Make
	else
		make
	endif
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

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

function! s:load_plugins(t) abort
	call s:plugin_pre_load()

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

	call s:plugin_post_load()
endfunction

func! s:plugin_pre_load()
	let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
	let g:ale_floating_window_border = repeat([''], 8)
	let g:ale_completion_enabled = 1
	let g:ale_fixers = { 'c': [ 'astyle'] }
	let g:ale_linters = {
		\ 'javascript': ['quicklintjs'],
		\ 'sh': ['shellcheck']
		\}
	let g:ale_lint_on_enter = 1
	let g:ale_disable_lsp = 0

	let g:ale_lint_delay = 0
	let g:ale_lint_on_text_changed = 'always'

	let g:ale_disable_lsp = 0
	let g:ale_linters_explicit = 1
	let g:ale_open_list = 1
	let g:ale_virtualtext_cursor = 0

	if !has("gui_running")
		let g:ale_set_highlights=0
	endif

	let g:birck_default_chan="irc.libera.chat"

	"let g:lsp_use_native_client = 1
	"let g:lsp_diagnostics_virtual_text_enabled = 0
	"let g:lsp_diagnostics_enabled  = 1
	"let g:lsp_diagnostics_echo_cursor  = 1
endfunc

func! s:plugin_post_load()
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
        "let sendmail_path = systemlist('sed -n "s/^set sendmail=\(.*\)$/\1/p; $!d" ~/.mailrc')
        "if len(sendmail_path) > 0
        "    "let g:notmuch_sendmail=sendmail_path[]
        "endif
    endif

endfunc

aug user_cmds
	au!
	au VimEnter * call timer_start(20, function('s:load_plugins'))
aug END

if !exists('g:undotree_WindowLayout')
	let g:undotree_WindowLayout = 4
	let g:undotree_ShortIndicators = 1
endif


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
