return {
  "rbong/vim-flog",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  keys = {
    { "<leader>gf", "<cmd>Flog<cr>", desc = "Git graph (Flog)" },
    { "<leader>gF", "<cmd>Flogsplit<cr>", desc = "Git graph split (Flog)" },
  },
  dependencies = {
    "tpope/vim-fugitive",
  },
  config = function()
    -- Appliquer le layout JKLM au buffer Flog
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "floggraph",
      callback = function()
        local opts = { buffer = true, noremap = true, silent = true }
        vim.keymap.set("n", "j", "h", opts)
        vim.keymap.set("n", "k", "j", opts)
        vim.keymap.set("n", "l", "k", opts)
        vim.keymap.set("n", "m", "l", opts)
      end,
    })
  end,
}

