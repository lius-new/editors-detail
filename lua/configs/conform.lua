local options = {
  formatters_by_ft = {
    -- lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    -- go = { "goimports_reviser", "golines", "gofmt" },
    go = { "golines", "gofmt" },
    javascript = { "prettier", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
    javascriptreact = { "prettier", stop_after_first = true },
    typescriptreact = { "prettier", stop_after_first = true },
    vue = { "prettier", stop_after_first = true },
    css = { "prettier", stop_after_first = true },
    scss = { "prettier", stop_after_first = true },
    less = { "prettier", stop_after_first = true },
    html = { "prettier", stop_after_first = true },
    json = { "prettier", stop_after_first = true },
    jsonc = { "prettier", stop_after_first = true },
    yaml = { "prettier", stop_after_first = true },
    markdown = { "prettier", stop_after_first = true },
    ["markdown.mdx"] = { "prettier", stop_after_first = true },
    graphql = { "prettier", stop_after_first = true },
    handlebars = { "prettier", stop_after_first = true },
    toml = { "taplo", stop_after_first = true },
    ["_"] = { "trim_whitespace" },
  },
  formatters = {
    goimports_reviser = {
      command = "goimports-reviser",
      args = { "-rm-unused", "-set-alias", "-format", "$FILENAME" },
      stdin = false,
    },
    taplo = {
      command = "taplo",
      args = { "fmt", "--option", "indent_tables=false", "-" },
      stdin = true,
      lsp_fallback = true,
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
