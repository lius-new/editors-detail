require("mason").setup {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- gopls
    "gopls",

    -- rust
    "rust-analyzer",
    "rustfmt",
    "codelldb",
  },
}
