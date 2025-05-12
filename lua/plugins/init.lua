return {
  -- Plugin untuk auto formatting ketika menyimpan file
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- Plugin untuk Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Emmet
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "blade", "php", "javascript", "typescript" },
  },
  -- Plugin untuk konfigurasi LSP di Neovim
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Plugin untuk auto formatting untuk berbagai bahasa
  {
    "sbdchd/neoformat",
    config = function()
      vim.g.neoformat_enabled_php = { "phpcbf", "prettier" }
      vim.g.neoformat_enabled_blade = { "blade_formatter" }
    end,
  },
  -- Plugin untuk Prettier, formatter untuk JavaScript/TypeScript, CSS, HTML, dll.
  {
    "prettier/vim-prettier",
    run = "yarn install",
    ft = { "javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown" },
  },
  -- Plugin untuk integrasi dengan berbagai tool linting dan formatting via LSP
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
  },
  -- Auto-completion engine untuk Neovim
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      }
    end,
  },
  -- Plugin snippet untuk berbagai bahasa
  {
    "L3MON4D3/LuaSnip",
    requires = "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  -- Plugin untuk menambah fungsionalitas LSP di TypeScript
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local ts_utils = require "nvim-lsp-ts-utils"

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
        ts_utils.setup {}
        ts_utils.setup_client(client)
      end

      require("lspconfig").tsserver.setup {
        on_attach = on_attach,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        cmd = { "typescript-language-server", "--stdio" },
      }
    end,
  },
  -- Plugin tambahan untuk TypeScript
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup {}
    end,
  },
  -- Fuzzy finder untuk berbagai file dan simbol dalam proyek
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },
  -- Plugin untuk menampilkan buffer dalam bentuk tab
  {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {}
      vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end,
  },
  -- Plugin untuk navigasi cepat dalam file
  {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<CR>", { noremap = true, silent = true })
    end,
  },
  -- File explorer dalam Neovim
  {
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 35,
          side = "left",
          mappings = {
            list = {
              { key = "<C-v>", action = "vsplit" },
              { key = "<C-x>", action = "split" },
            },
          },
        },
      }
      vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
  -- Plugin untuk manipulasi karakter sekeliling
  { "tpope/vim-surround" },
  -- Plugin untuk memudahkan penambahan dan penghapusan komentar
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  -- Plugin untuk menutup bracket, quotes, dll secara otomatis
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  -- Syntax highlighting yang lebih canggih berdasarkan AST
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "vim",
          "lua",
          "vimdoc",
          "svelte",
          "vue",
          "asm",
          "sql",
          "prisma",
          "dart",
          "python",
          "java",
          "c",
          "php",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end,
  },
  -- Plugin untuk melacak waktu coding
  { "wakatime/vim-wakatime", lazy = false },
  -- Plugin untuk menutup tag di file HTML, JSX, dan sejenisnya secara otomatis
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        enable_tag_close = true,
        enable_tag_rename = true,
        filetypes = {
          "html",
          "jsx",
          "vue",
          "tsx",
          "javascriptreact",
          "typescriptreact",
          "javascript",
        },
      }
    end,
  },
  -- Plugin untuk menampilkan signature fungsi saat coding
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {
        bind = true,
        handler_opts = {
          border = "rounded",
        },
      }
    end,
  },
  -- Plugin untuk mempercepat penulisan kode HTML dan CSS
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "blade", "php", "javascript", "typescript" },
  },
  -- Plugin untuk integrasi Git dalam Neovim
  {
    "tpope/vim-fugitive",
    config = function()
      -- Keybindings untuk memudahkan penggunaan
      vim.api.nvim_set_keymap("n", "gc", ":Git commit<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "gp", ":Git push<CR>", { noremap = true, silent = true })
    end,
  },
  -- Plugin untuk pengembangan Rust
  {
    "simrat39/rust-tools.nvim",
    requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
    config = function()
      require("rust-tools").setup {}
    end,
  },
  -- Plugin untuk pengembangan Go
  {
    "fatih/vim-go",
    config = function()
      vim.g.go_fmt_command = "goimports"
      vim.g.go_autodetect_gopath = 1
    end,
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
}
