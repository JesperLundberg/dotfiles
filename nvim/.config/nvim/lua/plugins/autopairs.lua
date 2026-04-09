local M = {}

M.spec = {
	src = "https://github.com/windwp/nvim-autopairs",
}

function M.setup()
	require("nvim-autopairs").setup({})
end

return M
