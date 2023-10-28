[配置参考](https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#set-up-rust-with-neovim)
[如何搭建调试的环境](https://morezerosthanones.com/posts/neovim_rust_debugging/#my-struggles-with-neovim-rust-debugging)

### 安装rust

`rust && rustfmt && cargo ...`

### 调试

```lua
{
    "mfussenegger/nvim-dap",
},
```

安装lldb

```
sudo pacman -S lldb
```

添加一些快捷键

```lua
M.lius_dap = {

  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "打断点",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "打开调试侧边栏",
    },
  },
}
```

### toml crate 支持

```lua
{
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  config = function(_, opts)
    local crates = require "crates"
    crates.setup(opts)
    crates.show()
  end,
},
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    -- ...
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
    -- ...
},
```

添加快捷键

```lua
M.lius_crate = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "更新所有的crate",
    },
  },
}
```
