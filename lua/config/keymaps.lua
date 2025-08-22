-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set

-- Normal mode
map("n", "j", "h", { desc = "Move left" })
map("n", "k", "j", { desc = "Move down" })
map("n", "l", "k", { desc = "Move up" })
map("n", "m", "l", { desc = "Move right" })

-- Visual mode
map("v", "j", "h", { desc = "Move left" })
map("v", "k", "j", { desc = "Move down" })
map("v", "l", "k", { desc = "Move up" })
map("v", "m", "l", { desc = "Move right" })

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
