vim.g.mapleader = ' '
local set = vim.opt
local g = vim.g

set.packpath="$XDG_DATA_HOME/nvim"

local map = require("utils").map
require("keybindings")


set.tabstop=4
set.number=true
set.laststatus=1
set.expandtab=false

set.hlsearch=true
set.incsearch=true
set.wrapscan=false
set.ignorecase=true
set.smartcase=true

require'lspconfig'.clangd.setup{}

set.shortmess="Iat"

g.netrw_banner = 0
g.netrw_liststyle = 3

require('nvim_comment').setup()

vim.cmd([[
function! s:load_plugins(t) abort
	packadd vim-fugitive
endfunction

augroup user_cmds
	autocmd!
	autocmd VimEnter * call timer_start(20, function('s:load_plugins'))
augroup END
]])

-- theme
-- hyper-red
-- TODO use lua api
vim.cmd('hi StatusLine ctermbg=white ctermfg=red')
vim.cmd('hi StatusLineNC ctermbg=white ctermfg=black')
vim.cmd('hi LineNr ctermbg=NONE ctermfg=red')
vim.cmd('set fillchars=vert:\\│')
vim.cmd('hi VertSplit term=NONE cterm=NONE gui=NONE')
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')



