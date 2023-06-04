vim.g.mapleader = ' '
local set = vim.opt
local g = vim.g

g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0

require'keybindings'

set.tabstop=4
set.shiftwidth=4
set.cursorline=true
set.cursorlineopt="number"
set.laststatus=2
set.wildignore:append("out/**")

set.exrc=true

set.hlsearch=true
set.incsearch=true
set.wrapscan=false

set.shortmess="Iat"

g.netrw_banner = 0
g.netrw_liststyle = 3

vim.cmd([[
" TODO use lua api

function! s:load_plugins(t) abort
	set packpath+=~/.local/share/vim
	packadd fzf
	packadd fzf.vim
	packadd vim-fugitive
	packadd vim-ninja-feet
	packadd vim-surround
	packadd vim-tmux-navigator
	packadd vim-unimpaired
	packadd vim-xcode

	packadd nvim-dap
	packadd nvim-dap-ui
	packadd nvim-lspconfig

	lua require"dapui".setup()
	lua require"lspconfig".clangd.setup{}
	lua require"unstaged"
endfunction

augroup user_cmds
	autocmd!
	autocmd VimEnter * call timer_start(20, function('s:load_plugins'))
augroup END
]])


