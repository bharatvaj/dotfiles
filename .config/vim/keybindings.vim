" General keybindings
nnoremap <leader>aa :argadd **<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cd :cdo<space>s/
nnoremap <leader>cs :cdo<space>s/
nnoremap <leader>ec :edit $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>ek :edit $XDG_CONFIG_HOME/vim/keybindings.vim<cr>
nnoremap <leader>et :set expandtab<cr>
nnoremap <leader>fa :find *
nnoremap <leader>ff :find *
nnoremap <leader>lb :ls<cr>:b<space>
nnoremap <leader>ld :ldo<space>s/
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>ls :ldo<space>s/
nnoremap <leader>pp :Rg<cr>
nnoremap <leader>pv :packadd vimspector<cr>
nnoremap <leader>sc :source $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>so :source %<cr>
nnoremap <leader>spp :set paste<cr>
nnoremap <leader>spa :set path+=**<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>ta :tab *
nnoremap <leader>vg :vimgrep<space>
" Buffer Creation
nnoremap <leader>sc :source $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>ss :split<cr>
nnoremap <leader>vv :vsplit<cr>
nnoremap <leader>wd :call DiffWithSaved()<cr>

" netrw keybindings
nnoremap <leader>sf :Ex<cr>

" Accessible completions
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>
" Emacs line navigation in insert mode
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>A
" Behave vim
nnoremap Y y$

" development
nnoremap <leader>oc :grepadd /:: %
nnoremap <leader>oh :grepadd /:: %

nnoremap <leader>fb :b *

fun! SaveAndBuild()
    :wall
    :Make
endfun

" quick navigation
nnoremap \f :GFiles<cr>
nnoremap \F :Files<cr>
" TODO setup this up with fzf
nnoremap \g :Ggrep<cr>

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

" useful
nnoremap <leader>nn :set number<cr>

" development
nnoremap <leader>bb :call SaveAndBuild()<CR>
nnoremap <leader>bc :Make clean<CR>

nnoremap <leader>fmv :call FileMvHelper()<CR>

" Quick save and write
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>qq :q<cr>

" vim-fugitive
nnoremap <leader>gb :G blame<cr>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>gr :G reset %<cr>
nnoremap <leader>gwq :Gwq<cr>
nnoremap <leader>lg :Glgrep<space>


" Generate ctags
nnoremap<leader>gt :!sh -c "ctags `git --ls-files`"<CR>

nnoremap <CR> :noh<CR><CR>:<backspace>

" Markdown - Add checkbox mode?
nnoremap <leader>cc :ChecklistToggleCheckbox<cr>
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
"nnoremap <leader>cd :ChecklistDisableCheckbox<cr>

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

" nb
" TODO open a fuzzy finder quickly. Even better use fuzzy finder without chdir
nnoremap <leader>nb :chdir $NB_PATH<cr>

nnoremap cn *``cgn
nnoremap cN *``cgN
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
vnoremap <expr> cn g:mc . "``cgn"
