return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform", -- event = 'BufWritePre', -- uncomment for format on save
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },
  {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {}
      vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 38,
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
  {
    "justinmk/vim-sneak",
    config = function()
      vim.api.nvim_set_keymap("n", "f", "<Plug>Sneak_f", { noremap = false })
      vim.api.nvim_set_keymap("n", "F", "<Plug>Sneak_F", { noremap = false })
    end,
  },
  {
    "tpope/vim-surround",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "vim",
        "lua",
        "vimdoc",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        enable_tag_close = true,
        enable_tag_rename = true,
        filetypes = {
          html = true,
          jsx = true,
          vue = true,
          tsx = true,
          javascriptreact = true,
          typescript = true,
          typescriptreact = true,
          javascript = true,
        },
      }
    end,
  },
}
