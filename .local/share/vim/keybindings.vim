" General keybindings
nnoremap <leader>co :copen<cr>
nnoremap <leader>cd :cdo<space>s/
nnoremap <leader>cs :cdo<space>s/
nnoremap <leader>ec :vsplit $HOME/.vimrc<cr>
nnoremap <leader>ek :vsplit $XDG_DATA_HOME/vim/keybindings.vim<cr>
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
nnoremap <leader>/ :cdo %s/
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>qd :cdo s/

" Buffer Creation
nnoremap <leader>sc :source $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>ss :split<cr>
nnoremap <leader>vv :vsplit<cr>
nnoremap <leader>wd :call DiffWithSaved()<cr>

fun! SaveAndSuspend()
    :w
    :suspend
endfun

nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z'..a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction


" Control
nnoremap <c-z> :call SaveAndSuspend()<cr>
inoremap <c-z> :call SaveAndSuspend()<cr>

" Accessible completions
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>
" Emacs line navigation in insert mode
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>A
inoremap <c-k> <c-o>D

" Behave vim
nnoremap Y y$
nnoremap Q :noh<cr>

" development
nnoremap <leader>oc :grepadd /:: %
nnoremap <leader>oh :grepadd /:: %

nnoremap <leader>fb :b *

nnoremap <c-/> :call FZYFiles()<cr>
" TODO reflect on whether <leader><leader> is productive, I keep hitting it
" accidentally
"nnoremap <leader><leader> :Rg<cr>
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
nnoremap<leader>gt :!sh -c "ctags `git ls-files`"<CR>

nnoremap <CR> :noh<CR><CR>:<backspace>

" Markdown - Add checkbox mode?
nnoremap <leader>cc :ChecklistToggleCheckbox<cr>
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>

let g:gutentags_file_list_command = 'rg --files'

" vim-fugitive
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>lg :Glgrep<space>

autocmd FileType markdown set cursorline

" Hide and format markdown elements like **bold**
autocmd FileType markdown set conceallevel=2

nnoremap <leader>h1 :call QuickUnderline(1)<cr>
nnoremap <leader>h2 :call QuickUnderline(2)<cr>

fun! GotoWindow(id)
    call win_gotoid(a:id)
endfun


fun! StartDebugging()
    doautocmd User DebuggingStarted
    :call vimspector#Launch()<CR>
endfun

" Easy save
nnoremap <esc>s :w<cr>

" Fly through windows
nnoremap <esc>h <c-w>h
nnoremap <esc>j <c-w>j
nnoremap <esc>k <c-w>k
nnoremap <esc>l <c-w>l

" Debugger remaps
nnoremap <F5> :call StartDebugging()<cr>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <S-F5> :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

fun! SetupDebuggingKeymaps()
    nmap <c-n> <Plug>VimspectorStepOver
    nmap <c-i> <Plug>VimspectorStepInto
    nmap <m-i> <Plug>VimspectorStepOut
    nmap <c-s-r> <Plug>VimspectorRestart
    nmap <F5> :call vimspector#Continue()<CR>
endfun

augroup debugmode
    autocmd User DebuggingStarted :call SetupDebuggingKeymaps()
augroup END

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

nnoremap cn *``cgn
nnoremap cN *``cgN
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
vnoremap <expr> cn g:mc . "``cgn"


