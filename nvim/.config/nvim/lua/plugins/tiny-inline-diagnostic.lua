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

	-- Disable inline virtual text since the plugin handles inline diagnostics
	vim.diagnostic.config({ virtual_text = false })
end

return M
