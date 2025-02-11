require("nvchad.options")

local opt = vim.opt
local api = vim.api

opt.relativenumber = true
opt.autoread = true
opt.scrolloff = 10

-- highlight yank
local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- fix comment on new line
api.nvim_create_autocmd({ "bufenter", "bufwinenter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[set formatoptions-=c formatoptions-=r formatoptions-=o]])
	end,
})

-- Change the padding and margin of the kitty terminal when entering and leaving neovim
api.nvim_create_autocmd("VimEnter", {
	command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

api.nvim_create_autocmd("VimLeavePre", {
	command = ":silent !kitty @ set-spacing padding=20 margin=10",
})

-- Set the commentstring to be // rather than the block comment /* */ for C# files
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("FixCppCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "// %s"
	end,
	pattern = { "cs", "bicep" },
})
