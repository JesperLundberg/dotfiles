-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- fix comment on new line
-- (FileType runs after the ftplugins, which would otherwise re-add these flags.
-- A global autocmd is needed here since after/ftplugin is per-filetype.)
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no-auto-comment", { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
