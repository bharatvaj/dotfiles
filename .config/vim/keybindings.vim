" General keybindings
nnoremap <leader>aa :argadd **<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cs :cdo<space>s/
nnoremap <leader>ec :edit $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>ek :edit $XDG_CONFIG_HOME/vim/keybindings.vim<cr>
nnoremap <leader>et :set expandtab<cr>
nnoremap <leader>ff :find *
nnoremap <leader>fb :buffer *
nnoremap <leader>lb :ls<cr>:b<space>
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>ls :ldo<space>s/
nnoremap <leader>pp :Rg<cr>
nnoremap <leader>pv :packadd vimspector<cr>
nnoremap <leader>sc :source $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>so :source %<cr>
nnoremap <leader>sp :set paste<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>vg :vimgrep<space>
" Buffer Creation
nnoremap <leader>sc :source $XDG_CONFIG_HOME/vim/vimrc<enter>
nnoremap <leader>ss :split<enter>
nnoremap <leader>vv :vsplit<enter>

" Accessible completions
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>
" Emacs line navigation in insert mode
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>A
" Behave vim
nnoremap Y y$

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Wq","wq")
call SetupCommandAlias("man","help")

nnoremap <leader>tb :call ToggleBackground()<CR>
nnoremap <leader>tl :call ToggleList()<CR>

" development
nnoremap <leader>bb :call SaveAndBuild()<CR>
nnoremap <leader>be :AbortDispatch<CR>
nnoremap <leader>bc :Make clean<CR>

nnoremap <leader>fmv :call FileMvHelper()<CR>

" Quick save and write
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>qq :q<cr>

" Fugitive
nnoremap <space>gd :Gvdiff<CR>


" Generate ctags
map <leader>gt :!sh -c "ctags `rg --files`"<CR>
set tags+=.git/tags

nnoremap <CR> :noh<CR><CR>:<backspace>

" Markdown
nnoremap <leader>cc :ChecklistToggleCheckbox<cr>

let g:gutentags_file_list_command = 'rg --files'

" vim-fugitive
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>lg :Glgrep<space>

autocmd FileType markdown set cursorline

" Hide and format markdown elements like **bold**
autocmd FileType markdown set conceallevel=2

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

nnoremap <leader>h1 :call QuickUnderline(1)<cr>
nnoremap <leader>h2 :call QuickUnderline(2)<cr>

fun! GotoWindow(id)
    call win_gotoid(a:id)
endfun

" Navigation maps
nnoremap \f :GFiles<CR>
nnoremap \F :Files<CR>

" Debugger remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
