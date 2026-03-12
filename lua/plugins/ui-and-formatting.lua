return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local file_path_component = {
        "filename",
        path = 1, -- chemin relatif au cwd
        color = { fg = "#000000", bg = "#00ff00", gui = "bold" },
      }

      opts.sections = opts.sections or {}
      opts.inactive_sections = opts.inactive_sections or {}

      opts.sections.lualine_c = { file_path_component }
      opts.inactive_sections.lualine_c = { file_path_component }
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.sql = { "pg_format" }
      opts.formatters_by_ft.mysql = { "pg_format" }
      opts.formatters_by_ft.plsql = { "pg_format" }

      opts.formatters = opts.formatters or {}
      opts.formatters.pg_format = {
        args = { "-k", "2", "-s", "2", "-w", "120", "-" },
      }
    end,
  },

}
