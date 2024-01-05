---@type MappingsTable
local M = {}
-- 注销的某些按键
M.disabled = {
  i = {
    ["<C-h>"] = "", -- 注销编辑模式下C-h会向前移动
    ["<C-b>"] = "", -- 注销编辑模式下C-h会向前移动
  },
  n = {
    ["<leader>/"] = "", -- 注销注释生成
    ["<C-n>"] = "", -- nvimtree 打开和关闭
    ["<leader>e"] = "", -- nvimtree 聚集
    ["<C-j>"] = "", -- 注销切换窗口内分屏
    ["<C-k>"] = "", -- 注销切换窗口内分屏
    ["<C-h>"] = "", -- 注销切换窗口内分屏
    ["<C-l>"] = "", -- 注销切换窗口内分屏
    ["<C-b>"] = "", -- 注销切换窗口内分屏
    ["<C-c>"] = "", -- 复制到剪切板
    ["<leader>h"] = "", -- leader打开底部终端
    ["<leader>v"] = "", -- leader打开一侧终端
  },
  v = {
    ["<leader>/"] = "", -- 注销注释生成
  },
}

M.general = {
  -- 普通模式下快捷键
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  -- 可视模式下快捷键
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!
-- 基本的快捷键
M.lius_base = {
  n = {
    -- Ctrl
    ["<C-u>"] = { "10k", "水平方向滚动" }, -- 水平方向翻动
    ["<C-d>"] = { "10j", "垂直方向滚动" }, -- 垂直方向翻动
    -- resize
    ["<C-j>"] = { "<cmd> resize +3<CR>", "增加宽度" },
    ["<C-k>"] = { "<cmd> resize -3<CR>", "减少宽度" },
    ["<C-h>"] = { "<cmd> vertical resize +3<CR>", "增加宽度" },
    ["<C-l>"] = { "<cmd> vertical resize -3<CR>", "减少宽度" },
    -- 格式化
    ["<C-f>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "格式化代码",
    },

    -- Leader
    ["<leader>s"] = { ":split<CR>", opts = { nowait = true }, "在右边打开" }, -- 水平方向切屏
    ["<leader>vs"] = { ":vsplit<CR>", opts = { nowait = true }, "在下面打开" }, -- 垂直方向切屏

    -- alt
    -- move
    ["<A-j>"] = { "<C-w>j", "聚焦窗口移动下面" }, -- 注销切换窗口内分屏
    ["<A-k>"] = { "<C-w>k", "聚焦窗口移动上面" }, -- 注销切换窗口内分屏
    ["<A-h>"] = { "<C-w>h", "聚焦窗口移动左面" }, -- 注销切换窗口内分屏
    ["<A-l>"] = { "<C-w>l", "聚焦窗口移动右面" }, -- 注销切换窗口内分屏
    ["<A-q>"] = { ":quit!<CR>", opts = { nowait = true }, "退出" }, -- 退出
  },
  x = {
    ["<C-c>"] = { "+y <CR>", "复制内容" }, -- 复制到剪切板
    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "主题" },
    -- bookmarks
    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

-- 注释
M.lius_comment = {
  n = {
    ["<C-/>"] = { -- 注释
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "编辑模式注释",
    },
  },
  v = {
    ["<C-/>"] = { -- 注释
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "可视模式注释",
    },
  },
}
-- 文件窗口
M.lius_nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "打开文件面板" }, -- nvimtree 切换
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "聚焦至文件面板" }, -- nvimtree 聚焦
  },
}
-- 查找
M.lius_telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

-- 终端
M.lius_nvterm = {

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "打开终端(悬浮)",
    },

    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "打开终端(底部)",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "打开终端(一侧)",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "打开终端(悬浮)",
    },

    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "打开终端(底部)",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "打开终端(一侧)",
    },
  },
}

-- 查找
M.lius_telescope = {

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "查找文件" },
    ["<leader>fa"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      "查找文件(全部)",
    },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep(查找文本)" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers(查找buffer)" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page(插件帮助页面)" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles(查找旧文件)" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer(指定的buffer)" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits(git 提交记录)" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status(git状态)" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term(查找终端)" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes(主题)" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks(书签)" },
  },
}

-- lsp
M.lius_lspconfig = {

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration(跳转到定义)",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition(跳转到定义)",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover(查看如何声明)",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename(修改名称)",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references(查看哪里引用了)",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>Q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

-- buffer
M.lius_tabufline = {

  n = {
    -- cycle through buffers
    ["<A-.>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<A-,>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "上个buffer",
    },
  },
}

-- symbols-outline
M.lius_symbols_outline = {
  plugin = true,
  n = {
    ["<leader>af"] = {
      "<cmd> SymbolsOutline <CR>",
      "文件大纲",
    },
  },
}
-- 重启neovide clipboard
M.lius_neovide = {
  n = {
    ["<leader>cr"] = {
      function()
        print("restart clipboard")
        vim.g.loaded_clipboard_provider = nil
        vim.api.nvim_cmd({ cmd = "runtime", args = { "autoload/provider/clipboard.vim" } }, {})
      end,
      "重启neovide的 clipboard",
    },
  },
}

return M
