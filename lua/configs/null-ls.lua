-- null-ls.lua

local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "json", "javascript", "typescript", "css", "html", "tsx" },
    },
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint, -- untuk JavaScript/TypeScript
  },
}
