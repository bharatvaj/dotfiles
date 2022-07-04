local map = require("utils").map
map("n", "<Leader>ww", ":w<CR>", { silent = true })
map("n", "<Leader>wq", ":wq<CR>", { silent = true })
map("n", "<Leader>qq", ":q<CR>", { silent = true })
map("n", "<CR>", ":noh<CR>", { silent = true })

map("n", "<leader>f", ":find ", { silent = false })
map("n", "<leader>co", ":copen<cr>", { silent = false })
map("n", "<leader>g", ":grep ", { silent = false})
map("n", "<leader>ec", ":edit ~/.config/nvim/init.lua<cr>", { silent = false})
