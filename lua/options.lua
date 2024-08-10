require "nvchad.options"

-- add yours here!
vim.o.exrc = true -- enable exrc

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- neovide configuration
if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h7"
  vim.g.neovide_text_gamma = 0.8      -- 文本伽马值
  vim.g.neovide_text_contrast = 0.1   -- 文本对比度
  vim.g.neovide_window_blurred = true -- neovide窗口模糊
end
