local plugins = {
  -- MASON plugin
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },
  -- TODO plugin
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      require("todo-comments").setup()
    end,
    lazy = false, -- 取消lazy loader
  },
  -- outline plugin
  {
    "simrat39/symbols-outline.nvim",
    opts = function()
      require("symbols-outline").setup()
    end,
    lazy = false, -- 取消lazy loader
  },
  ----------golang plugin----------
  -- Go 开发的简约插件
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  ----------rust plugin----------
  -- rust crate plugin
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  ----------debug plugin----------
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
      },
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
  },
}

return plugins
