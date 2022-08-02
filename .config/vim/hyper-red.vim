" Hyper Red
" TODO handle tCo lesss that 16 case
" TODO handle light theme
" Probably use a autogroup for handling tCo count change
" Do it in lua
hi StatusLine ctermbg=white ctermfg=red
if &background == "dark"
		hi StatusLineNC ctermbg=white ctermfg=black
else
		hi StatusLineNC ctermbg=black ctermfg=white
endif
hi LineNr ctermbg=NONE ctermfg=DarkGray
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
hi Visual ctermbg=LightGray ctermfg=DarkGray guibg=LightGray guifg=DarkGray
hi Search ctermbg=Blue ctermfg=White guibg=Blue guifg=White
hi Todo ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=Yellow

