-- conform.lua

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    py = { "black" },
    css = { "prettier" },
    html = { "prettier" },
    tsx = { "prettier" },
    json = { "prettier" },
  },

  format_on_save = true,
}

return options
