" Hyper Red
" TODO handle tCo lesss that 16 case
" TODO handle light theme
" Probably use a autogroup for handling tCo count change
" Do it in lua
if &background == "dark"
	hi StatusLine guibg=white ctermbg=white guifg=black ctermfg=black
	hi StatusLineNC guibg=lightgray ctermbg=lightgray guifg=black ctermfg=black
else
	hi StatusLine guibg=black ctermbg=black guifg=white ctermfg=white
	hi StatusLineNC guibg=darkgray ctermbg=darkgray guifg=white ctermfg=white
endif
hi LineNr guibg=NONE ctermbg=NONE guifg=DarkGray ctermfg=DarkGray
set fillchars=vert:\│
hi VertSplit term=NONE cterm=NONE gui=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment ctermfg=DarkGray guifg=DarkGray
hi Statement ctermfg=red guifg=red
hi Type ctermfg=LightGray guifg=LightGray
hi PreProc ctermfg=LightGray guifg=LightGray
hi Constant ctermfg=red guifg=red
hi String ctermfg=lightred guifg=lightred
hi Special ctermfg=red guifg=red
hi Identifier ctermfg=white guifg=white
hi Visual ctermbg=DarkGray ctermfg=white guibg=DarkGray guifg=white
hi Search ctermbg=Blue ctermfg=White guibg=Blue guifg=White
hi Todo ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=Yellow
