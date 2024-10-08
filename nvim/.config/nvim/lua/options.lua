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

-- toggle inlay hints (requires nvim version >= 10)
-- api.nvim_create_autocmd({ "LspAttach", "InsertEnter", "InsertLeave" }, {
-- 	callback = function(args)
-- 		local enabled = args.event ~= "InsertEnter"
-- 		vim.lsp.inlay_hint.enable(args.buf, enabled)
-- 	end,
-- })
