" General keybindings
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>ec :edit ~/.config/vim/vimrc<cr>
nnoremap <leader>ek :edit ~/.config/vim/keybindings/keybindings.vim<cr>
nnoremap <leader>f :find *
nnoremap <leader>gg :vimgrep<space>
nnoremap <leader>p :Rg<cr>
nnoremap <leader>t :tabnew<cr>

# Behave vim
nnoremap Y y$

fun! GitFind()
endfun

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Wq","wq")

function! ToggleList()
	if &list == "nolist"
		set list
	else
		set nolist
	endif
endfunction

nnoremap <leader>tl :call ToggleList()<CR>

" Buffer Creation
nnoremap <Leader>vv :vsplit<enter>
nnoremap <Leader>ss :split<enter>
nnoremap <Leader>sc :source ~/.config/vim/vimrc<enter>

" Quick save and write
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ww :w<cr>
nnoremap <leader>qq :q<cr>

" Fugitive
nnoremap <space>gd :Gvdiff<CR>

" Run Make

function SaveAndBuild()
		wall
		Make
endfunction

nnoremap <leader>bb :call SaveAndBuild()<CR>

" Generate ctags
map <leader>c :!ctags -R -f ./.git/tags .<CR>

nnoremap <CR> :noh<CR><CR>:<backspace>

" Plugin keybindings
source ~/.config/vim/keybindings/vimspector.vim
source ~/.config/vim/keybindings/markdown.vim

" Development keybindings
" TODO Have a default build hotkey keybinding, maybe bb,br?
" And make it based on the project
" Make it as a filetype plugin. This should cover most cases.
nnoremap <leader>cb :Cargo build<cr>
nnoremap <leader>cr :Cargo run<cr>
