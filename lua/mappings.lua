-- Mengimpor pengaturan default mappings dari NvChad
require "nvchad.mappings"

-- Menambahkan keybindings Anda sendiri
local map = vim.keymap.set

-- Keybindings yang sudah ada
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Menambahkan keybindings untuk navigasi LSP diagnostics
map("n", "<leader>dn", function()
  vim.lsp.diagnostic.goto_next()
end, { desc = "Go to next diagnostic" })
map("n", "<leader>dp", function()
  vim.lsp.diagnostic.goto_prev()
end, { desc = "Go to previous diagnostic" })

-- Menampilkan hover informasi dari LSP
map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "Show hover information" })

-- Keybindings untuk refactoring
map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code action (refactor, fix)" })
map("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format code" })
