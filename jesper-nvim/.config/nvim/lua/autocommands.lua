-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- fix comment on new line
vim.api.nvim_create_autocmd({ "bufenter", "bufwinenter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[set formatoptions-=c formatoptions-=r formatoptions-=o]])
	end,
})

-- Change the padding and margin of the kitty terminal when entering and leaving neovim
vim.api.nvim_create_autocmd("VimEnter", {
	command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	command = ":silent !kitty @ set-spacing padding=20 margin=10",
})

-- Set the commentstring to be // rather than the block comment /* */ for C# files
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("FixCSharpCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "// %s"
	end,
	pattern = { "cs", "bicep" },
})
