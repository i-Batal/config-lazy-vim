require("config.lazy")
require("config.highlights")

-- 1️⃣ Désactiver globalement les diagnostics visuels
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
})

-- 2️⃣ Désactiver les diagnostics au moment où un LSP se connecte
require("lspconfig").lua_ls.setup({
  on_attach = function(client, bufnr)
    vim.diagnostic.disable(bufnr)
  end,
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
