local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "html", -- HTML LSP
  "rust_analyzer", -- Rust Analyzer
  "pylsp", -- Python LSP
  "tailwindcss", -- Tailwind CSS LSP
  "sqls", -- SQL LSP
  "clangd", -- C/C++ LSP
  "eslint", -- ESLint LSP
  "nextls", -- Next.js LSP
  "jsonls", -- JSON LSP
  "tsserver", -- TypeScript/JavaScript LSP
  "bashls", -- Bash LSP
  "cssls", -- CSS LSP
  "dockerls", -- Dockerfile LSP
  "docker_compose_language_service", -- Docker Compose LSP
  "yamlls", -- YAML LSP
  "nginx_language_server", -- Nginx LSP
  "lua_ls", -- Lua LSP
  "gopls", -- golang
  "emmet_ls",
  "asm_lsp",
  "hls", -- haskell
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.asm_lsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "asm", "s" },
}

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      gofumpt = true, -- Aktifkan gofumpt sebagai formatter
    },
  },
}

lspconfig.emmet_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
}

-- Konfigurasi tambahan untuk tsserver
lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    local ts_utils = require "nvim-lsp-ts-utils"
    ts_utils.setup {}
    ts_utils.setup_client(client)

    -- Key mappings untuk TypeScript/JavaScript
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  end,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    ["rust-analyzer"] = {
      -- cargo = {
      --   allFeatures = true,
      -- },
      -- procMacro = {
      --   enable = true,
      -- },
      -- diagnostics = {
      --   enable = true,
      --   enableExperimental = true,
      -- },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

lspconfig.pylsp.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        pylsp_mypy = { enabled = true },
        pylsp_rope = { enabled = true },
        pylsp_black = { enabled = true },
        pylsp_isort = { enabled = true },
        pylsp_yapf = { enabled = false },
      },
    },
  },
}
