return {
  {
    "tpope/vim-dadbod",
  },

  -- Interface UI pour vim-dadbod (comme DataGrip)
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion", -- Autocomplétion SQL
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Configuration de vim-dadbod-ui
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 40

      -- Icônes
      vim.g.db_ui_icons = {
        expanded = {
          db = "▾ ",
          buffers = "▾ ",
          saved_queries = "▾ ",
          schemas = "▾ ",
          schema = "▾ פּ",
          tables = "▾ 藺",
          table = "▾ ",
        },
        collapsed = {
          db = "▸ ",
          buffers = "▸ ",
          saved_queries = "▸ ",
          schemas = "▸ ",
          schema = "▸ פּ",
          tables = "▸ 藺",
          table = "▸ ",
        },
        saved_query = "",
        new_query = "璘",
        tables = "離",
        buffers = "﬘",
        add_connection = "",
        connection_ok = "✓",
        connection_error = "✕",
      }

      -- Keymaps pour vim-dadbod
      vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "Toggle DBUI" })
      vim.keymap.set("n", "<leader>df", "<cmd>DBUIFindBuffer<cr>", { desc = "DBUI Find buffer" })
      vim.keymap.set("n", "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", { desc = "DBUI Rename buffer" })
      vim.keymap.set("n", "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", { desc = "DBUI Last query info" })
    end,
  },

  -- Autocomplétion pour SQL
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = "tpope/vim-dadbod",
    ft = { "sql", "mysql", "plsql" },
    init = function()
      -- Configuration de l'autocomplétion pour les fichiers SQL
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          local cmp = require("cmp")
          cmp.setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          })
        end,
      })
    end,
  },
}

