local M = {}

M.spec = {
	src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
}

function M.setup()
	require("tiny-inline-diagnostic").setup()
	-- Disable inline virtual text since the plugin handles inline diagnostics
	vim.diagnostic.config({ virtual_text = false })
end

return M
