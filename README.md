## 开发环境

### 安装golang

### 配置环境变量

```bash
export GOROOT=/usr/lib/go
export GOBIN=$GOROOT/bin
export GOPROXY=https://proxy.golang.com.cn,direct
export GOPATH=/home/lius/Documents/coder/go-resp
export PATH=$PATH:$GOBIN:$GOPATH/bin:$PATH
```

### gopls

```lua
M.mason = {
  ensure_installed = {
    -- golang
    "gopls"
  },
}
```

### lsp配置

```lua
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
      },
    },
  },
}
```

### 代码格式化

```lua
local sources = {
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,
}
```

需要分别执行:

```
go install github.com/incu6us/goimports-reviser/v3@latest
go install mvdan.cc/gofumpt@latest
go install github.com/segmentio/golines@latest
```

最好配置代理,可能要管理员权限执行。

### 代码调试

安装`delve`

```bash
go install github.com/go-delve/delve/cmd/dlv@latest
```

```lua
-- dap {
"mfussenegger/nvim-dap",
init = function()
  require("core.utils").load_mappings "lius_dap"
end,
},
{
"leoluz/nvim-dap-go",
ft = "go",
dependencies = "mfussenegger/nvim-dap",
config = function(_, opts)
  require("dap-go").setup(opts)
  require("core.utils").load_mappings "lius_dap_go"
end,
},
```

添加快捷键映射

```lua
-- dap
M.lius_dap = {

  n = {
    -- cycle through buffers
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "标记断点",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "打开断点侧边栏",
    },
  },
}
-- dap_go
M.lius_dap_go = {
  plugin = true,

  -- :DapStepOver
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "运行最近的test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "重新运行上一个的test",
    },
  },
}
```

可以通过`:DapStepOver`跳转,实际上都是类似的.

### 安装增强插件

```lua
{
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function()
    require("gopher").setup()
    require("core.utils").load_mappings "lius_gopher"
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
},
```

配置快捷键

```lua
-- olex gopher mapping
M.lius_gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "结构体中添加json",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yml <CR>",
      "结构体中添加yml",
    },
  },
}
```
