return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  opts = {
    servers = {
      lua_ls = {},
      pylsp = {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pylsp" }, -- ici, pas dans plugins
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = true },
              pycodestyle = { enabled = true },
              mccabe = { enabled = true },
            },
          },
        },
      },
    },
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
