" Hyper Red
" TODO handle tCo less than 16 case
" TODO handle light theme
" Probably use a autogroup for handling tCo count change
" Do it in lua
if &background == "dark"
	hi StatusLine ctermfg=Black ctermbg=LightBlue guifg=black guibg=white
	hi StatusLineNC guibg=lightgray ctermbg=lightgray guifg=black ctermfg=black
else
	hi StatusLine guibg=darkblue ctermbg=darkblue guifg=white ctermfg=white
	hi StatusLineNC guibg=darkgray ctermbg=darkgray guifg=white ctermfg=white
endif
hi LineNr guibg=NONE ctermbg=NONE guifg=DarkGray ctermfg=DarkGray
set fillchars=vert:\│
hi VertSplit term=NONE cterm=NONE gui=NONE
hi SignColumn ctermbg=NONE guibg=NONE
if empty($DISPLAY)
hi Comment ctermfg=NONE
else
hi Comment ctermfg=DarkGray guifg=DarkGray
hi Visual ctermbg=DarkGray ctermfg=white guibg=DarkGray guifg=white
hi Type ctermfg=LightGray guifg=LightGray
hi PreProc ctermfg=LightGray guifg=LightGray
endif

hi Statement ctermfg=Red guifg=LightGreen
hi Constant ctermfg=Red guifg=Red
hi String cterm=bold ctermfg=NONE guifg=LightRed
hi Special cterm=bold ctermfg=LightBlue guifg=LightYellow
hi Identifier ctermfg=White guifg=White
hi Search ctermbg=Blue ctermfg=White guibg=Blue guifg=White
hi Todo cterm=underline ctermbg=NONE ctermfg=LightYellow guibg=NONE guifg=LightYellow

hi MatchParen ctermbg=NONE cterm=underline ctermfg=Magenta
