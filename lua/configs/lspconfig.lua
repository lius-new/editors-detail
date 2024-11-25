-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- 代码增强
local inlayhints = require "lsp-inlayhints"
-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- golang config
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    inlayhints.on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      -- 自动导入
      completeUnimported = true,
      -- 使用函数时自动输入占位的参数
      usePlaceholders = true,
      -- 代码分析(分析变量函数未调用情况)
      analyses = {
        unusedparams = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
      -- 显示增强
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
lspconfig.rust_analyzer.setup {
  -- on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      inlayHints = {
        typeHints = true,
        parameterHints = true,
        chainingHints = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    inlayhints.on_attach(client, bufnr)
  end,
}
lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    inlayhints.on_attach(client, bufnr)
  end,
  filetypes = { "typescript", "typescriptreact", "tsx", "javascript", "javascriptreact", "jsx" },
  cmd = { "typescript-language-server", "--stdio" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}
