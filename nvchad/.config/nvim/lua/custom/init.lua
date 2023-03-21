-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--  
local opt = vim.opt

-- Disable cursorline
opt.cursorline = false

-- Disable swap and bak files
opt.undofile = false
