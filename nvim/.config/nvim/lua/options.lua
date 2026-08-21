-- UI
vim.opt.shortmess:append("I") -- Skip the startup screen
vim.opt.number = true -- LIne numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.showmode = false -- Show mode in command area
vim.opt.signcolumn = "yes" -- Show the sign column
vim.opt.termguicolors = true -- 24-bit terminal colors
vim.opt.laststatus = 3 -- Use one global statusline for all windows

-- Editing
vim.opt.breakindent = true -- Preserve indentation on wrapped lines
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Indent by two spaces
vim.opt.tabstop = 2 -- Display tabs as two spaces
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" } -- Configure whitespace symbols

-- Search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Match case if search contains uppercase
vim.opt.inccommand = "split" -- Preview substitutions live

-- Files
vim.opt.undofile = true -- Persist undo history between sessions
vim.opt.confirm = true -- Ask before losing unsaved changes

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Timing
vim.opt.updatetime = 250 -- Time before CursorHold events
vim.opt.timeoutlen = 300 -- Time to wait for mapped key sequences

-- Cursor
vim.opt.scrolloff = 20 -- Keep 20 lines visible around the cursor

-- Defer clipboard setup to avoid startup cost
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
