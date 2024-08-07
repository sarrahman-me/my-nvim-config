-- Existing LSP configurations
local lspconfig = require "lspconfig"

local servers = {
  "html",
  "rust_analyzer",
  "pylsp",
  "tsserver",
  "tailwindcss",
  "sqls",
  "clangd",
  "eslint",
  "nextls",
  "svelte",
  "jsonls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    local ts_utils = require "nvim-lsp-ts-utils"

    -- Defaults
    ts_utils.setup {}
    ts_utils.setup_client(client)

    -- Mappings
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
  cmd = { "typescript-language-server", "--stdio" },
}
