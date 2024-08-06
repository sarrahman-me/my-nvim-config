local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    py = { "black" },
    css = { "prettier" },
    html = { "prettier" },
    tsx = { "prettier" },
  },

  format_on_save = true, -- Aktifkan format otomatis saat menyimpan
}

return options
