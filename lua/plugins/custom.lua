local plugins = {

  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },

  -- If your opts uses a function call ex: require*, then make opts spec a function
  -- should return the modified default config as well
  -- here we just call the default telescope config
  -- And edit its mappinsg
  -- TODO plugin
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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

}

return plugins
