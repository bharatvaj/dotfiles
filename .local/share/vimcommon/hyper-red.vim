" Hyper Red
" TODO handle tCo less than 16 case
" TODO handle light theme
" Probably use a autogroup for handling tCo count change
" Do it in lua
if &background == "dark"
	hi! LineNr guibg=NONE ctermbg=NONE guifg=DarkGray ctermfg=DarkGray
	hi! CursorLineNr cterm=NONE gui=NONE guibg=NONE ctermbg=NONE guifg=White ctermfg=White
	hi! StatusLine cterm=bold gui=bold ctermfg=White ctermbg=Red guifg=White guibg=Red
	hi! StatusLineNC guibg=LightGray ctermbg=LightGray guifg=Black ctermfg=Black
	hi! Statement ctermfg=Red guifg=Red
	hi! Constant ctermfg=LightGreen guifg=LightGreen
	hi! String ctermfg=LightBlue guifg=LightBlue
	hi! Special cterm=bold ctermfg=LightMagenta guifg=LightMagenta
	hi! Identifier ctermfg=White guifg=White
	hi! IncSearch ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow
	hi! Search ctermbg=LightBlue ctermfg=Black guibg=DarkGray guifg=Black
	hi! Todo cterm=underline ctermbg=NONE ctermfg=LightYellow guibg=NONE guifg=LightYellow
	hi! Comment ctermfg=DarkGray guifg=DarkGray
	hi! Visual ctermbg=White ctermfg=Black guibg=White guifg=Black
	hi! Type ctermfg=LightGray guifg=LightGray
	hi! PreProc ctermfg=DarkGray guifg=DarkGray
	hi! MatchParen ctermbg=NONE cterm=underline ctermfg=LightMagenta
else
	hi! LineNr cterm=NONE gui=NONE guibg=NONE ctermbg=NONE guifg=LightGray ctermfg=LightGray
	hi! StatusLine cterm=bold gui=bold guibg=NONE ctermbg=NONE guifg=Black ctermfg=Black
	hi! StatusLineNC guibg=DarkGray ctermbg=DarkGray guifg=White ctermfg=White
	hi! Statement ctermfg=Red guifg=Red
	hi! Constant ctermfg=Green guifg=Green
	hi! String ctermfg=DarkBlue guifg=DarkBlue
	hi! Special cterm=bold ctermfg=DarkMagenta guifg=DarkMagenta
	hi! Identifier ctermfg=Black guifg=Black
	hi! IncSearch ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow
	hi! Search ctermbg=Blue ctermfg=White guibg=Blue guifg=White
	hi! Todo cterm=underline,bold ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=Yellow
	hi! Comment ctermfg=LightGray guifg=LightGray
	hi! Visual ctermbg=Black ctermfg=white guibg=Black guifg=white
	hi! Type ctermfg=DarkGray guifg=DarkGray
	hi! PreProc ctermfg=LightGray guifg=LightGray
	hi! MatchParen guibg=NONE ctermbg=NONE gui=underline cterm=underline guifg=DarkMagenta ctermfg=DarkMagenta
endif
set fillchars=vert:\│
hi! VertSplit term=NONE cterm=NONE gui=NONE
hi! SignColumn ctermbg=NONE guibg=NONE

if (&t_Co == 8)
	hi! Comment ctermfg=NONE
endif
