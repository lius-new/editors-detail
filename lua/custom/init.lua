-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


local opt = vim.opt

opt.clipboard = "unnamed,unnamedplus"

-- 代码折叠设置
opt.foldenable = true
opt.foldmethod = "manual"
opt.foldcolumn = "0"
opt.foldlevel = 3

-- neovide font
vim.o.guifont = "FiraNerd Code:h8"
