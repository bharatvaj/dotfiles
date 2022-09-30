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

" TODO load this automatically
source $XDG_CONFIG_HOME/vim/ftplugin/cpp.vim


" Mail
set rtp+=~/.local/share/nvim/pack/general/start/himalaya/vim


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
