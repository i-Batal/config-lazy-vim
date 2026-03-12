return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    -- Ouvre les fichiers LazyGit dans l'instance Neovim courante (via nvr)
    if vim.fn.executable("nvr") == 1 then
      vim.g.lazygit_use_neovim_remote = 1
    end
  end,
}
