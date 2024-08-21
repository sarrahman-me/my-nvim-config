local options = {
  formatters_by_ft = {
    go = { "gofumpt", "gofmt" }, -- Formatter untuk Go
    dart = { "dartfmt" },
    lua = { "stylua" }, -- Formatter untuk Lua
    python = { "black" }, -- Formatter untuk Python
    py = { "black" }, -- Alias untuk Python
    css = { "prettier" }, -- Formatter untuk CSS
    html = { "prettier" }, -- Formatter untuk HTML
    tsx = { "prettier" }, -- Formatter untuk TypeScript React (TSX)
    json = { "prettier" }, -- Formatter untuk JSON
    javascript = { "prettier" }, -- Formatter untuk JavaScript
    typescript = { "prettier" }, -- Formatter untuk TypeScript
    markdown = { "prettier" }, -- Formatter untuk Markdown
    yaml = { "prettier" }, -- Formatter untuk YAML
    toml = { "taplo" }, -- Formatter untuk toml
  },

  format_on_save = true, -- Format otomatis saat menyimpan file
}

return options
