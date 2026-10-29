local M = {}

M.spec = {
	src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
}

function M.setup()
	require("tiny-inline-diagnostic").setup({
		options = {
			overflow = {
				mode = "wrap",
				padding = 2,
			},

			break_line = {
				enabled = true,
				after = 80,
			},
		},
	})
end

return M
