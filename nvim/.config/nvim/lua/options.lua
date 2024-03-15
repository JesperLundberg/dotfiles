require("nvchad.options")

local opt = vim.opt
local api = vim.api

opt.relativenumber = true

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
