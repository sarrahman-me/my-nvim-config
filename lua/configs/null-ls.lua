local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    -- Formatters
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "json", "javascript", "typescript", "css", "html", "tsx" },
    },
    null_ls.builtins.formatting.stylua, -- Untuk Lua
    null_ls.builtins.formatting.black, -- Untuk Python
    null_ls.builtins.formatting.clang_format, -- Untuk C/C++
    null_ls.builtins.formatting.taplo, -- Untuk toml

    -- Linters
    null_ls.builtins.diagnostics.eslint, -- Untuk JavaScript/TypeScript
    null_ls.builtins.diagnostics.flake8, -- Untuk Python
  },
}
