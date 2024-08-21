vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Pengaturan untuk menggulir horizontal
vim.opt.scrolloff = 5
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 5

-- Aktifkan dukungan mouse
vim.opt.mouse = "a"

-- Nonaktifkan teks membungkus
vim.opt.wrap = true

-- Aktifkan virtual text untuk diagnostics
vim.diagnostic.config {
  virtual_text = true,
}

-- Mengimpor konfigurasi LSP
require "configs.lspConfig"

-- Mengimpor konfigurasi null-ls
require "configs.null-ls"

-- Pengaturan untuk nomor baris dinamis
vim.opt.relativenumber = true -- Nomor baris relatif diaktifkan secara default

-- Buat augroup untuk toggling nomor baris
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Atur nomor baris relatif saat berada di normal mode dan nomor baris absolut saat berada di insert mode
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { command = "set relativenumber", group = "numbertoggle" }
)

vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { command = "set norelativenumber", group = "numbertoggle" }
)

vim.wo.relativenumber = true

vim.g.user_emmet_leader_key = "<C-Z>"

vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require("conform").format { async = false, timeout_ms = 0 }
  end,
})
