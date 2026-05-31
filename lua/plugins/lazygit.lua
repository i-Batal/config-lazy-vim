-- LazyGit via Snacks: ouvrir nvim dans le terminal LazyGit
return {
  {
    "kdheepak/lazygit.nvim",
    enabled = false,
  },
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        configure = true,
        config = {
          os = {
            editPreset = "nvim",
            editInTerminal = true,
          },
        },
      },
    },
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit({ cwd = LazyVim.root.git() })
        end,
        desc = "LazyGit (root)",
      },
      {
        "<leader>gG",
        function()
          Snacks.lazygit()
        end,
        desc = "LazyGit (cwd)",
      },
    },
  },
}
