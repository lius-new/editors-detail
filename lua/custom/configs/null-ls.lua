local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- golang
  -- go install github.com/incu6us/goimports-reviser/v3@latest
  b.formatting.gofumpt,
  -- go install mvdan.cc/gofumpt@latest
  b.formatting.goimports_reviser,
  -- go install github.com/segmentio/golines@latest
  b.formatting.golines,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
