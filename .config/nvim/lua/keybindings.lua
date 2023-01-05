-- keybindings local set = vim.opt
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

local map = vim.keymap.set

map('n', "U", '<c-r>')
map('n', "<c-r>", '"')

map('n', "z/", ':%s/')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local lspbuf = vim.lsp.buf
  local bufopts = { noremap=true, buffer=args.buf }
  map({'n', 'v'}, '<a-CR>', lspbuf.code_action, bufopts)
  map('n', 'gD', lspbuf.declaration, bufopts)
  map('n', 'gd', lspbuf.definition, bufopts)
  map('n', 'K', lspbuf.hover, bufopts)
  map('n', 'gi', lspbuf.implementation, bufopts)
  map('n', '<space>D', lspbuf.type_definition, bufopts)
  map('n', '<space>rn', lspbuf.rename, bufopts)
  map('n', '<space>ca', lspbuf.code_action, bufopts)
  map('n', 'gr', lspbuf.references, bufopts)
  map('n', '<space>f', function() lspbuf.format { async = true } end, bufopts)
  end
})

vim.cmd([[
function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
]])

function file_mv_helper()
	vim.cmd('normal! 0i"A"0y$A p0imv j0')
end

-- general
map("n", "<leader>aa", ":argadd **<cr>")
map("n", "<leader>co", ":copen<cr>")
map("n", "<leader>cd", ":cdo<space>s/")
map("n", "<leader>ec", ":edit $XDG_CONFIG_HOME/nvim/init.lua<cr>")
map("n", "<leader>ek", ":edit $XDG_CONFIG_HOME/nvim/lua/keybindings.lua<cr>")
map("n", "<leader>et", ":set expandtab<cr>")
map("n", "<leader>lb", ":ls<CR>:b<space>")
map("n", "<leader>lo", ":lopen<cr>")
map("n", "<leader>ld", ":ldo<space>s/")
map("n", "<leader>p", ":Rg<cr>")
map("n", "<leader>sc", ":source $XDG_CONFIG_HOME/nvim/init.lua<cr>")
map("n", "<leader>so", ":source %<cr>")
map("n", "<leader>spp", ":set paste<cr>")
map("n", "<leader>spa", ":set path+=**<cr>")
map("n", "<leader>tl", ":lua toggle_list(true)<CR>")
map("n", "<leader>tt", ":tabnew<cr>")
map("n", "<leader>vg", ":vimgrep<space>")
map("n", "<leader>wd", ":call DiffWithSaved()<cr>")

-- quick write and quit
map("n", "<Leader>qq", ":q<CR>")
map("n", "<Leader>ww", ":w<CR>")
map("n", "<leader><cr>", ":noh<CR>")

-- buffers
map("n", "<leader>sc", ":source ~/.config/vim/vimrc<enter>")
map("n", "<leader>ss", ":split<enter>")
map("n", "<leader>vv", ":vsplit<enter>")

-- nvim-dap
map("n", "<leader>dd", ":lua require'dap'.continue()<cr>")
map("n", "<leader>de", ":lua require'dap'.terminate()<cr> | :lua require'dap'.close()<cr>")
map("n", "<leader>dl", ":lua require'dap'.step_into()<cr>")
map("n", "<leader>dj", ":lua require'dap'.step_over()<cr>")
map("n", "<leader>dk", ":lua require'dap'.step_out()<cr>")
map("n", "<leader>dr", ":lua require'dap'.restart()<cr>")

-- nvim-dap-ui
map("n", "<leader>du", ":lua require'dapui'.toggle()<cr>")

map("n", "<leader>drc", ":lua require'dap'.RunToCursor()")
map("n", "<leader>db" , ":lua require'dap'.toggle_breakpoint()<cr>")
map("n", "<leader>dcb", ":lua require'dap'.ToggleConditionalBreakpoint()")

-- map("n", "<leader>dc", ":call GotoWindow(require'dap'.session_windows.code)<CR>")
-- map("n", "<leader>dt", ":call GotoWindow(require'dap'.session_windows.tagpage)<CR>")
-- map("n", "<leader>dv", ":call GotoWindow(require'dap'.session_windows.variables)<CR>")
-- map("n", "<leader>dw", ":call GotoWindow(require'dap'.session_windows.watches)<CR>")
-- map("n", "<leader>ds", ":call GotoWindow(require'dap'.session_windows.stack_trace)<CR>")
-- map("n", "<leader>do", ":call GotoWindow(require'dap'.session_windows.output)<CR>")
-- map("n", "<leader>dtcb", ":call vimspector#CleanLineBreakpoint()<CR>")

map("n", "<leader>bb", ":lua save_and_build()<CR>")
map("n", "<leader>bc", ":Make clean<CR>")


-- development
map("n", "<leader>oc", ":grepadd /:: %")
map("n", "<leader>oh", ":grepadd /:: %")

vim.keymap.set('n', '\\f', ":CommandTGit<cr>")
vim.keymap.set('n', '\\F', ":CommandTFind<cr>")
vim.keymap.set('n', '\\g', ":CommandTGit<cr>")
vim.keymap.set('n', '\\b', ":CommandTBuffer<cr>")


-- quick navigation
map("n", "<leader>fb", ":b *")
map("n", "<leader>ff", ":find *")
map("n", "<leader>fs", ":set foldmethod=syntax<cr>")


-- file helpers
map("n", "<leader>fmv", "lua file_mv_helper()")

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

map("n", "<leader>h1", ":lua doc_quick_underline(1)<cr>")
map("n", "<leader>h2", ":lua doc_quick_underline(2)<cr>")


map("n", "<leader>ct", ":ChecklistToggleCheckbox<cr>")
map("n", "<leader>ce", ":ChecklistEnableCheckbox<cr>")
-- map("n", "<leader>cd", ":ChecklistDisableCheckbox<cr>")

-- vim.g.checklist_filetypes:append('adoc', 'md')

-- vim-fugitive
map("n", "<leader>gb", ":G blame<cr>")
map("n", "<leader>gd", ":Gvdiff<cr>")
map("n", "<leader>gg", ":Ggrep<space>")
map("n", "<leader>gr", ":G reset %<cr>")
map("n", "<leader>gwq", ":Gwq<cr>")
map("n", "<leader>lg", ":Glgrep<space>")

-- useful
map("n", "<leader>nn", ":set number<cr>")

-- neovim diagnostics
map("n", "<leader>sd", ":lua vim.diagnostic.open_float()<cr>")

-- netrw keybindings
map("n", "<leader>sf", ":Ex<cr>")

-- subst with power
map("n", "cn", "*``cgn")
map("n", "cN", "*``cgN")
vim.cmd([[
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
vnoremap <expr> cn g:mc . "``cgn"
]])

-- nb
-- TODO open a fuzzy finder quickly. Even better use fuzzy finder without chdir
map("n", "<leader>nb", ":chdir $NB_PATH<cr> | :pwd<cr>")
