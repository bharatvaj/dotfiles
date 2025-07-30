" Hyper Red
" TODO handle tCo less than 16 case
" TODO handle light theme
" Probably use a autogroup for handling tCo count change
" Do it in lua

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

hi! VertSplit term=NONE cterm=NONE gui=NONE
hi! SignColumn ctermbg=NONE guibg=NONE

if &background == "dark"
	hi! Normal ctermbg=Black guibg=Black ctermfg=White guifg=White
	hi! ColorColumn guifg=White ctermfg=White guibg=DarkGray ctermbg=DarkGray
	hi! Folded guifg=Blue ctermfg=Blue guibg=NONE ctermbg=NONE cterm=bold
	hi! FoldColumn guifg=Blue ctermfg=Blue guibg=NONE ctermbg=NONE cterm=bold
	hi! DiffChange guifg=NONE ctermfg=LightYellow guibg=LightYellow ctermbg=NONE
	hi! DiffText guifg=NONE ctermfg=LightBlue guibg=LightBlue ctermbg=Yellow cterm=bold
	hi! DiffAdd guibg=LightGreen ctermbg=LightGreen guifg=NONE ctermfg=NONE
	hi! DiffDelete guifg=Red ctermfg=Red guibg=NONE ctermbg=NONE
	hi! LineNr guibg=NONE ctermbg=NONE guifg=DarkGray ctermfg=DarkGray
	hi! CursorLineNr cterm=NONE gui=NONE guibg=NONE ctermbg=NONE guifg=Red ctermfg=White
	hi! StatusLineNC guibg=Black ctermbg=Black guifg=DarkGray ctermfg=DarkGray
	hi! Statement ctermfg=DarkRed guifg=DarkRed
	hi! Constant gui=bold ctermfg=Magenta guifg=Magenta
	hi! Error ctermbg=NONE guibg=NONE ctermfg=DarkRed guifg=DarkRed
	hi! String ctermfg=Red guifg=Red
	hi! Special cterm=NONE ctermfg=LightRed guifg=LightRed
	hi! Identifier ctermfg=White guifg=White
	hi! IncSearch ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow
	hi! Search ctermbg=Blue ctermfg=White guibg=Blue guifg=White
	hi! Todo gui=underline,bold cterm=underline,bold ctermfg=White ctermbg=Red guifg=White guibg=Red
	hi! Comment ctermfg=DarkGray guifg=DarkGray
	hi! Visual ctermbg=LightGray ctermfg=NONE guibg=LightGray guifg=NONE
	hi! Type gui=bold ctermfg=DarkYellow guifg=DarkYellow
	hi! PreProc ctermfg=DarkGray guifg=DarkGray
	hi! MatchParen ctermbg=Black cterm=underline ctermfg=LightMagenta
else
	hi! Normal ctermbg=White guibg=White ctermfg=Black guifg=Black
	hi! ColorColumn guifg=Black ctermfg=Black guibg=LightGray ctermbg=LightGray
	hi! Folded guifg=Blue ctermfg=Blue guibg=NONE ctermbg=NONE cterm=bold
	hi! FoldColumn guifg=Blue ctermfg=Blue guibg=NONE ctermbg=NONE cterm=bold
	hi! DiffChange guifg=NONE ctermfg=LightYellow guibg=LightYellow ctermbg=NONE
	hi! DiffText guifg=NONE ctermfg=LightBlue guibg=LightBlue ctermbg=Yellow cterm=bold
	hi! DiffAdd guibg=LightGreen ctermbg=LightGreen guifg=NONE ctermfg=NONE
	hi! DiffDelete guifg=Red ctermfg=Red guibg=NONE ctermbg=NONE
	hi! LineNr cterm=NONE gui=NONE guibg=NONE ctermbg=NONE guifg=LightGray ctermfg=LightGray
	hi! CursorLineNr cterm=NONE gui=NONE guibg=NONE ctermbg=NONE guifg=Red ctermfg=White
	hi! StatusLineNC guibg=Black ctermbg=Black guifg=DarkGray ctermfg=DarkGray
	hi! Constant gui=bold ctermfg=Magenta guifg=Magenta
	hi! String ctermfg=LightRed guifg=LightRed
	hi! Identifier ctermfg=Black guifg=Black
	hi! IncSearch ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow
	hi! Search ctermbg=Blue ctermfg=White guibg=Blue guifg=White
	hi! Todo gui=underline,bold cterm=underline,bold ctermfg=White ctermbg=Red guifg=White guibg=Red
	hi! Statement ctermfg=DarkRed guifg=DarkRed
	hi! Comment ctermfg=DarkGray guifg=DarkGray
	hi! Special cterm=bold gui=bold ctermbg=NONE ctermfg=LightBlue guibg=NONE guifg=LightBlue
	hi! SpecialKey cterm=NONE ctermfg=Gray guifg=Gray
	hi! NonText cterm=NONE ctermfg=LightGray guifg=LightGray
	hi! Type gui=bold ctermfg=DarkYellow guifg=DarkYellow
	hi! PreProc ctermfg=DarkMagenta guifg=DarkMagenta
	hi! MatchParen guibg=LightGray ctermbg=LightGray gui=underline cterm=underline guifg=DarkMagenta ctermfg=DarkMagenta
endif

if has('fillchars')
	set fillchars=vert:\│
endif

set listchars=tab:\|\ ,lead:-,trail:-,eol:\.

if (&t_Co == 8)
	hi! Comment ctermfg=NONE
endif
