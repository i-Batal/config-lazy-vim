-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- 1) Dire à LazyVim d'utiliser habamax
  { "LazyVim/LazyVim", opts = { colorscheme = "habamax" } },

  -- 2) (Optionnel) Désactiver complètement tokyonight
  { "folke/tokyonight.nvim", enabled = false },
}
