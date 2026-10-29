local M = {}

M.spec = {
	src = "https://github.com/seblyng/roslyn.nvim",
}

function M.setup()
	require("roslyn").setup({
		broad_search = true,
	})
end

return M
