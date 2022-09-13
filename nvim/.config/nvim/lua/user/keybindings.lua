-- use space as a the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true
}

local map = vim.api.nvim_set_keymap

-- Telescope
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", opt)
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", opt)

