vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    -- Mots-clés SQL en rouge
    vim.api.nvim_set_hl(0, "sqlKeyword", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "sqlStatement", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "sqlSpecial", { fg = "#ff0000", bold = true })
  end,
})

