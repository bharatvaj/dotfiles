-- keybindings
local set = vim.opt

function save_and_build()
-- TODO require vim-dispatch
		vim.cmd('wall')
		vim.cmd('Make')
end

function toggle_list(is_local_buffer)
	-- TODO implement toggle for all buffers
	local optset=vim.o
	if optset.list then
		optset.list=false
	else
		optset.list=true
	end
end

function file_mv_helper()
	vim.cmd('normal! 0i"A"0y$A p0imv j0')
end

-- Run Make
local map = require("utils").map
-- general
map("n", "<leader>co", ":copen<cr>", { silent = false })
map("n", "<leader>cs", ":cdo<space>s/", { silent = false })
map("n", "<leader>ec", ":edit $XDG_CONFIG_HOME/nvim/init.lua<cr>", { silent = true })
map("n", "<leader>ek", ":edit $XDG_CONFIG_HOME/nvim/lua/keybindings.lua<cr>", { silent = false })
map("n", "<leader>et", ":set expandtab<cr>", { silent = false })
map("n", "<leader>ff", ":find *", { silent = false })
map("n", "<leader>lb", ":ls<CR>:b<space>", { silent = false })
map("n", "<leader>lo", ":lopen<cr>", { silent = false })
map("n", "<leader>ls", ":ldo<space>s/", { silent = false })
map("n", "<leader>p", ":Rg<cr>", { silent = false })
map("n", "<leader>sc", ":source $XDG_CONFIG_HOME/nvim/init.lua<cr>", { silent = false })
map("n", "<leader>so", ":source %<cr>", { silent = false })
map("n", "<leader>tl", ":lua toggle_list(true)<CR>", { silent = true })
map("n", "<leader>tt", ":tabnew<cr>", { silent = false })
map("n", "<leader>vg", ":vimgrep<space>", { silent = false })

-- quick write and quit
map("n", "<Leader>ww", ":w<CR>", { silent = true })
map("n", "<Leader>wq", ":wq<CR>", { silent = true })
map("n", "<Leader>qq", ":q<CR>", { silent = true })
map("n", "<leader>cs", ":noh<CR>", { silent = true })

-- buffers
map("n", "<leader>sc", ":source ~/.config/vim/vimrc<enter>", { silent = true })
map("n", "<leader>ss", ":split<enter>", { silent = true })
map("n", "<leader>vv", ":vsplit<enter>", { silent = true })

-- vimspector
map("n", "<leader>dd", ":call vimspector#Launch()<CR>", { silent = true })
map("n", "<leader>dc", ":call GotoWindow(g:vimspector_session_windows.code)<CR>", { silent = true })
map("n", "<leader>dt", ":call GotoWindow(g:vimspector_session_windows.tagpage)<CR>", { silent = true })
map("n", "<leader>dv", ":call GotoWindow(g:vimspector_session_windows.variables)<CR>", { silent = true })
map("n", "<leader>dw", ":call GotoWindow(g:vimspector_session_windows.watches)<CR>", { silent = true })
map("n", "<leader>ds", ":call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>", { silent = true })
map("n", "<leader>do", ":call GotoWindow(g:vimspector_session_windows.output)<CR>", { silent = true })
map("n", "<leader>de", ":call vimspector#Reset()<CR>", { silent = true })

map("n", "<leader>dtcb", ":call vimspector#CleanLineBreakpoint()<CR>", { silent = true })

map("n", "<leader>dl", "<Plug>VimspectorStepInto", { silent = true })
map("n", "<leader>dj", "<Plug>VimspectorStepOver", { silent = true })
map("n", "<leader>dk", "<Plug>VimspectorStepOut", { silent = true })
map("n", "<leader>d_", "<Plug>VimspectorRestart", { silent = true })
map("n", "<leader>d<space>", ":call vimspector#Continue()<CR>", { silent = true })

map("n", "<leader>drc", "<Plug>VimspectorRunToCursor", { silent = true })
map("n", "<leader>dbp" , "<Plug>VimspectorToggleBreakpoint", { silent = true })
map("n", "<leader>dcbp", "<Plug>VimspectorToggleConditionalBreakpoint", { silent = true })

map("n", "<leader>bb", ":lua save_and_build()<CR>", { silent = false })

-- quick navigation
-- telscope.nvim
map("n", "<leader><leader>", ":Telescope find_files<cr>", { silent = true })

-- file helpers
map("n", "<leader>fmv", "lua file_mv_helper()",  { silent = true })

-- doc functions
function doc_quick_underline(n)
	if (n == 1) then
		vim.cmd('normal! yypv$r=')
	else
		vim.cmd('normal! yypv$r-')
	end
end

function reverse_date()
	vim.cmd('normal! dt/wwpldeBP')
end

map("n", "<leader>h1", ":lua doc_quick_underline(1)<cr>", { silent = true });
map("n", "<leader>h2", ":lua doc_quick_underline(2)<cr>", { silent = true });


map("n", "<leader>ct", ":ChecklistToggleCheckbox<cr>", { silent = true });
map("n", "<leader>ce", ":ChecklistEnableCheckbox<cr>", { silent = true });
map("n", "<leader>cd", ":ChecklistDisableCheckbox<cr>", { silent = true });
map("n", "<leader>ct", ":ChecklistToggleCheckbox<cr>", { silent = true });
map("n", "<leader>ce", ":ChecklistEnableCheckbox<cr>", { silent = true });
map("n", "<leader>cd", ":ChecklistDisableCheckbox<cr>", { silent = true });

-- vim.g.checklist_filetypes:append('adoc', 'md')

-- vim-fugitive
map("n", "<leader>gg", ":Ggrep<space>", { silent = false });
map("n", "<leader>lg", ":Glgrep<space>", { silent = false });
map("n", "<leader>gwq", ":Gwq<cr>", { silent = false });
