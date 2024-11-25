require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Disable mappings
-----------------
nomap({ "i", "n" }, "<C-k>")
nomap({ "i", "n" }, "<C-h>")
nomap({ "n", "v" }, "<leader>/") -- 取消键位功能: 注释
nomap("i", "<C-b>")
nomap("n", "<C-n>") -- 取消键位功能: nvimtree 打开和关闭
nomap("n", "<leader>e") -- 取消键位功能: nvimtree 聚集
nomap("n", "<C-j>") -- 取消键位功能: 注销切换窗口内分屏
nomap("n", "<C-l>") -- 取消键位功能: 注销切换窗口内分屏
nomap("n", "<C-c>") -- 取消键位功能: 复制到剪切板
-- nomap({ "n","t"}, "<leader>h")          -- 取消键位功能: leader打开底部终端
-- nomap({ "n", "t" }, "<leader>v") -- 取消键位功能: leader打开一侧终端
map("n", "<leader>v", "<CR>", { desc = "取消打开终端" })
map("n", "<leader>h", "<CR>", { desc = "取消打开终端" })
-- map("n", "<leader>h", function() end, { desc = "" }) -- 取消键位功能: leader打开底部终端
-- map("t", "<leader>h", function() end, { desc = "" }) -- 取消键位功能: leader打开底部终端
-- map("n", "<leader>v", function() end, { desc = "" }) -- 取消键位功能: leader打开底部终端
-- map("t", "<leader>v", function() end, { desc = "" }) -- 取消键位功能: leader打开底部终端

-- add yours here
------------------
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-u>", "10k", { desc = "Cursor 光标向上移动10行" })
map("n", "<C-d>", "10j", { desc = "Cursor 光标向下移动10行" })

map("n", "<leader>s", ":split<CR>", { desc = "Window 水平方向切屏" })
map("n", "<leader>vs", ":vsplit<CR>", { desc = "Window 垂直方向切屏" })
map("n", "<leader>qq", ":quit!<CR>", { desc = "Window 关闭当前编辑窗口" })

map("n", "<C-j>", "<C-w>j", { desc = "Window 聚焦窗口移动下面" })
map("n", "<C-k>", "<C-w>k", { desc = "Window 聚焦窗口移动上面" })
map("n", "<C-h>", "<C-w>h", { desc = "Window 聚焦窗口移动左面" })
map("n", "<C-l>", "<C-w>l", { desc = "Window 聚焦窗口移动右面" })
map("n", "<A-j>", "<cmd> resize +3<CR>", { desc = "Window 当前窗口增加宽度" })
map("n", "<A-k>", "<cmd> resize -3<CR>", { desc = "Window 当前窗口减少宽度" })
map("n", "<A-h>", "<cmd> vertical resize +3<CR>", { desc = "Window 当前窗口增加宽度" })
map("n", "<A-l>", "<cmd> vertical resize -3<CR>", { desc = "Window 当前窗口减少宽度" })

map("n", "<leader>cb", ":bdelete <CR>", { desc = "Buffer 关闭当前buffer" })
map("n", "<A-.>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer 移动到前一个Buffer" })
map("n", "<A-,>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer 移动到后一个Buffer" })

map("x", "<C-c>", "+y <CR>", { desc = "Copy 复制内容到剪切板" })
map("n", "<C-/>", "gcc", { desc = "Comemnt comment toggle", remap = true })
map("v", "<C-/>", "gc", { desc = "Comemnt comment toggle", remap = true })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true, async = true }
end, { desc = "Format 格式化多个文件" })
map("n", "<C-f>", function()
  -- vim.lsp.buf.format { async = true, lsp_fallback = true }
  vim.cmd ":w" -- WARN: can delete
  require("conform").format { lsp_fallback = true, async = true }
end, { desc = "Format 格式化代码" })

map("n", "<C-b>", "<cmd> NvimTreeToggle <CR>", { desc = "Explore 打开侧边文件面板" })
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "Explore 聚焦侧边文件面板" })

map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find 根据文件名查找文件" })
map(
  "n",
  "<leader>fa",
  "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
  { desc = "Find 根据文件名查找文件(包括隐藏文件)" }
)
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Find 根据内容来查找文件" })
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find 查找Buffer" })
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Find 查找帮助页面" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find 查找旧文件" })
map("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find 查找当前Buffer" })
map("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Find Git Commit记录" })
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Find Git Status" })
map("n", "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Find 查找终端" })
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Find 修改主题" })
map("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "Find 查找标记" })

-- toggle terminal
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Terminal toggleable vertical term" })
map({ "n", "t" }, "<A-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal new horizontal term" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal toggle floating term" })

-- global lsp mappings
map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "LSP definition(跳转到定义)" })
map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "LSP 查看签名帮助信息" })
map("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP 接口实现" })
map("n", "<leader>D", function()
  vim.lsp.buf.type_definition()
end, { desc = "LSP 查看签名类型定义" })
map("n", "<leader>ra", function()
  require("nvchad.renamer").open()
end, { desc = "LSP 修改变量名称" })
map("n", "<A-CR>", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP 代码事件(如修复,重构等)" })
map("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "LSP 查看何处引用" })
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP 浮动框中显示诊断信息" })
map("n", "[d", function()
  vim.diagnostic.goto_prev { float = { border = "rounded" } }
end, { desc = "LSP 跳转前个诊断信息处" })
map("n", "]d", function()
  vim.diagnostic.goto_next { float = { border = "rounded" } }
end, { desc = "LSP 跳转下个诊断信息处" })
map("n", "<leader>ee", function()
  vim.diagnostic.setloclist()
end, { desc = "LSP 显示所有的诊断信息" })

map("n", "<leader>wa", function()
  vim.lsp.buf.add_workspace_folder()
end, { desc = "Workspace 添加workspace" })
map("n", "<leader>wr", function()
  vim.lsp.buf.remove_workspace_folder()
end, { desc = "Workspace 移除workspace" })
map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "Workspace 显示所有的workspace" })

map("n", "<leader>af", "<cmd> SymbolsOutline <CR>", { desc = "Outline 文件大纲" })

map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "GoPher 为结构体添加json" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "GoPher 为结构体添加yaml" })
map("n", "<leader>gst", "<cmd> GoTagAdd toml <CR>", { desc = "GoPher 为结构体添加toml" })
map("n", "<leader>gsg", "<cmd> GoTagAdd gorm <CR>", { desc = "GoPher 为结构体添加gorm" })
map("n", "<leader>gie", "<cmd> GoIfErr <CR>", { desc = "GoPher 为结构体添加if err语段" })
map("n", "<leader>gft", "<cmd> GoTestAdd <CR>", { desc = "GoPher 为当前函数生成测试" })
map("n", "<leader>gfat", "<cmd> GoTestsAdd <CR>", { desc = "GoPher 为当前文件生成测试" })

local dap = require "dap"
map("n", "<leader>ds", function()
  require("telescope").extensions.dap.configurations {}
end, { desc = "Dap 启动调试" })
map("n", "<leader>dd", function()
  dap.terminate()
end, { desc = "Dap 启动调试" })
map("n", "<leader>dn", function()
  dap.step_over()
end, { desc = "Dap 执行当前行并移动到下一行" })
map("n", "<leader>di", function()
  dap.step_into()
end, { desc = "Dap 进入当前行的函数调用" })
map("n", "<leader>do", function()
  dap.step_out()
end, { desc = "Dap 退出当前函数并返回到调用该函数的地方" })
map("n", "<leader>dlb", function()
  require("telescope").extensions.dap.list_breakpoints {}
end, { desc = "Dap 显示所有的断点" })
map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "Dap 在当前行添加或移除断点" })
map("n", "<leader>dib", function()
  dap.set_breakpoint()
end, { desc = "Dap 在当前行设置带条件的断点。" })
map("n", "<leader>dob", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Dap 设置日志点, 此处不暂停,而是记录日志信息" })
map("n", "<leader>dr", function()
  dap.repl.open()
end, { desc = "Dap 调试器的REPL窗口, 可查看调试命令或变量值" })
map("n", "<leader>dls", function()
  dap.run_last()
end, { desc = "Dap 重新运行上一次的调试会话" })
map("n", "<leader>dhk", function()
  require("dap.ui.widgets").hover()
end, { desc = "Dap 显示当前光标所在位置或选中内容的变量信息" })
map("n", "<leader>dpk", function()
  require("dap.ui.widgets").preview()
end, { desc = "Dap 预览当前变量或表达式的值" })
map("n", "<leader>dwf", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end, { desc = "Dap 打开一个浮动窗口，显示当前的调用堆栈" })
map("n", "<leader>dws", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "Dap 打开一个浮动窗口，显示当前的作用域和变量信息" })
