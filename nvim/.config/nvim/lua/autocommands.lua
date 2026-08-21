-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- fix comment on new line
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[set formatoptions-=c formatoptions-=r formatoptions-=o]])
	end,
})

-- Set the commentstring to be // rather than the block comment /* */ for C# files
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("FixCSharpCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "// %s"
	end,
	pattern = { "cs", "bicep" },
})
