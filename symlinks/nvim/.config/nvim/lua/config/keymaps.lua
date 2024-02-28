-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <ctrl> <shift> hjkl keys
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move to window using the <option> hjkl keys
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
