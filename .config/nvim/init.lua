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
	source $XDG_DATA_HOME/vim/hyper-red.vim
	source $XDG_DATA_HOME/vim/plugins.vim
]])

function load_plugns()
	vim.cmd([[
	packadd vim-fugitive
	packadd vim-ninja-feet
	packadd vim-surround
	packadd vim-tmux-navigator
	packadd vim-unimpaired
	packadd vim-xcode
	packadd vim-dispatch
	]])
	--require"dapui".setup()
	--require"lspconfig".clangd.setup{}
	--require"unstaged"

	--require('dap').adapters.cppdbg = {
	--	type = 'executable',
	--	command = 'lldb-vscode',
	--	name = 'cppdbg'
	--}

	--require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })
end

vim.defer_fn(function() load_plugns() end, 20)

