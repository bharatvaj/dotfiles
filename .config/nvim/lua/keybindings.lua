local map = vim.keymap.set

vim.cmd[[source $XDG_CONFIG_HOME/vim/keybindings.vim]]

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

function file_mv_helper()
	vim.cmd('normal! 0i"A"0y$A p0imv j0')
end

-- general
map("n", "<leader>ec", ":edit $XDG_CONFIG_HOME/nvim/init.lua<cr>")
map("n", "<leader>sc", ":source $XDG_CONFIG_HOME/nvim/init.lua<cr>")

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

-- neovim diagnostics
map("n", "<leader>sd", ":lua vim.diagnostic.open_float()<cr>")
