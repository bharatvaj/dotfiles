vim.g.mapleader = ' '
local set = vim.opt

local map = require("utils").map

map("n", "<Leader>ww", ":w<CR>", { silent = true })
map("n", "<Leader>wq", ":wq<CR>", { silent = true })
map("n", "<Leader>qq", ":q<CR>", { silent = true })
map("n", "<CR>", ":noh<CR>", { silent = true })


set.tabstop=4
