-- disable diagnostics for all buffers when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.diagnostic.disable(args.buf)
  end,
})

-- also force global config
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})
