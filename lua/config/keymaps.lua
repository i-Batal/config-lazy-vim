-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  Layout JKLM (décalé d'une touche vers la droite)                        ║
-- ║  j = gauche (h), k = bas (j), l = haut (k), m = droite (l)               ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- Modes normal / visuel / operator-pending
for _, m in ipairs({ "n", "x", "o" }) do
  map(m, "j", "h", opts) -- gauche
  map(m, "k", "j", opts) -- bas
  map(m, "l", "k", opts) -- haut
  map(m, "m", "l", opts) -- droite

  -- Majuscules pour mouvements étendus
  map(m, "J", "^", opts) -- début de ligne (non-blank)
  map(m, "M", "$", opts) -- fin de ligne
  map(m, "K", "5j", opts) -- 5 lignes bas
  map(m, "L", "5k", opts) -- 5 lignes haut
end

-- Navigation fenêtres avec Ctrl+jklm
map("n", "<C-j>", "<C-w>h", opts) -- fenêtre gauche
map("n", "<C-k>", "<C-w>j", opts) -- fenêtre bas
map("n", "<C-l>", "<C-w>k", opts) -- fenêtre haut
map("n", "<C-m>", "<C-w>l", opts) -- fenêtre droite

-- remap ù → : en mode normal et visuel
map("n", "ù", ":", { noremap = true })
map("v", "ù", ":", { noremap = true })

-- ouvrir le dossier parent dans oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "Ouvrir le parent directory avec Oil" })

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  Fonction utilitaire pour appliquer JKLM sur un buffer                   ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

local function apply_jklm_to_buffer(buf)
  local buf_opts = { buffer = buf, noremap = true, silent = true }
  map("n", "j", "h", buf_opts)
  map("n", "k", "j", buf_opts)
  map("n", "l", "k", buf_opts)
  map("n", "m", "l", buf_opts)
end

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  Autocmds pour tous les filetypes spéciaux                               ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- Liste des filetypes qui ont besoin du remap JKLM
local jklm_filetypes = {
  "dbui", -- vim-dadbod-ui
  "dbout", -- résultats SQL
  "lazy", -- lazy.nvim
  "mason", -- mason.nvim
  "oil", -- oil.nvim
  "neo-tree", -- neo-tree
  "NvimTree", -- nvim-tree
  "fugitive", -- vim-fugitive
  "git", -- git buffers
  "gitcommit", -- git commit
  "help", -- aide vim
  "man", -- pages man
  "qf", -- quickfix
  "trouble", -- trouble.nvim
  "Outline", -- symbols-outline
  "aerial", -- aerial.nvim
  "undotree", -- undotree
  "diff", -- diff mode
  "DressingSelect", -- dressing.nvim
  "notify", -- nvim-notify
  "noice", -- noice.nvim
  "TelescopeResults", -- telescope results
  "spectre_panel", -- nvim-spectre
  "DiffviewFiles", -- diffview.nvim
  "NeogitStatus", -- neogit
  "NeogitPopup", -- neogit popup
  "NeogitCommitMessage", -- neogit commit
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = jklm_filetypes,
  callback = function(ev)
    apply_jklm_to_buffer(ev.buf)
  end,
})

-- Pour les buffers spéciaux qu'on ne peut pas détecter par filetype
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function(ev)
    local buf = ev.buf
    local buftype = vim.bo[buf].buftype
    local filetype = vim.bo[buf].filetype

    -- Buffers non-fichiers (popups, menus, etc.)
    if buftype == "nofile" or buftype == "prompt" or buftype == "popup" then
      -- Vérifie si c'est pas déjà un filetype connu
      if not vim.tbl_contains(jklm_filetypes, filetype) then
        apply_jklm_to_buffer(buf)
      end
    end
  end,
})

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  Configuration Telescope                                                 ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end
    -- Navigation dans le menu avec Ctrl+k/l
    map("i", "<C-k>", t("<C-n>"), { buffer = true }) -- item suivant (bas)
    map("i", "<C-l>", t("<C-p>"), { buffer = true }) -- item précédent (haut)
  end,
})

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  Configuration blink.cmp (completion) via plugin                         ║
-- ║  Note: Déjà configuré dans lua/plugins/completion.lua                    ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
