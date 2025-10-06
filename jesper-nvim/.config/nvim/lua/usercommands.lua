-- Define a user command :OpenScratch
vim.api.nvim_create_user_command("OpenScratch", function(opts)
	-- create a scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false
	vim.bo[buf].buftype = "nofile"

	-- set filetype if given
	if opts.args ~= "" then
		vim.bo[buf].filetype = opts.args
	end

	-- open it in a new split window
	vim.cmd("split")
	vim.api.nvim_win_set_buf(0, buf)
end, {
	nargs = "?", -- optional argument
	complete = "filetype", -- gives you completion for filetypes
})
