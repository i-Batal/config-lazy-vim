-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Modes normal / visuel / operator-pending
for _, m in ipairs({ "n", "x", "o" }) do
  map(m, "j", "h", opts) -- gauche
  map(m, "k", "j", opts) -- bas
  map(m, "l", "k", opts) -- haut
  map(m, "m", "l", opts) -- droite
end

-- remap ù → : en mode normal
map("n", "ù", ":", { noremap = true })

-- (optionnel) en mode visuel aussi
map("v", "ù", ":", { noremap = true })

-- ouvrir le dossier parent dans oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Ouvrir le parent directory avec Oil" })

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereher tabs" })
