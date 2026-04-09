local M = {}

M.spec = {
	{
		src = "https://github.com/max397574/better-escape.nvim",
	},
	{
		src = "https://github.com/gbprod/cutlass.nvim",
	},
}

function M.setup()
	require("better_escape").setup({})
	require("cutlass").setup({})
end

return M
