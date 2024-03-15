local opt = vim.opt
local api = vim.api

-- enable relativenumbers
opt.relativenumber = true

-- pandoc related
opt.spell = false
opt.foldmethod = "manual"
opt.foldenable = false

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
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[set formatoptions-=c formatoptions-=r formatoptions-=o]])
	end,
})
