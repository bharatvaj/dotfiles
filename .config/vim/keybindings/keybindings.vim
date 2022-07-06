" General keybindings
nnoremap <Leader>lb :ls<CR>:b<space>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cs :cdo<space>s/
nnoremap <leader>ec :edit $XDG_CONFIG_HOME/vim/vimrc<cr>
nnoremap <leader>ek :edit $XDG_CONFIG_HOME/vim/keybindings/keybindings.vim<cr>
nnoremap <leader>et :set expandtab<cr>
nnoremap <leader>f :find *
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>ls :ldo<space>s/
nnoremap <leader>p :Rg<cr>
nnoremap <leader>so :source %<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>vg :vimgrep<space>
" Buffer Creation
nnoremap <Leader>sc :source ~/.config/vim/vimrc<enter>
nnoremap <Leader>ss :split<enter>
nnoremap <Leader>vv :vsplit<enter>

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

nnoremap <leader>tl :call ToggleList()<CR>
nnoremap <leader>bb :call SaveAndBuild()<CR>
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

" Plugin keybindings
source $XDG_CONFIG_HOME/vim/keybindings/vimspector.vim
source $XDG_CONFIG_HOME/vim/keybindings/markdown.vim

" Development keybindings
" TODO Have a default build hotkey keybinding, maybe bb,br?
" And make it based on the project
" Make it as a filetype plugin. This should cover most cases.
" Cargo
nnoremap <leader>cb :Cargo build<cr>
nnoremap <leader>cr :Cargo run<cr>
" Markdown
nnoremap <leader>cc :ChecklistToggleCheckbox<cr>

"ctrlp.vim
let g:ctrlp_map = '<tab><tab>'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'r'
let g:gutentags_file_list_command = 'rg --files'
nnoremap <leader><leader> :CtrlPTag<cr>
" vim-fugitive
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>lg :Glgrep<space>

