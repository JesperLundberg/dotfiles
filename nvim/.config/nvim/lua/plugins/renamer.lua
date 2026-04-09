local M = {}

M.spec = {
	-- Dependency
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	-- Main plugin
	{ src = "https://github.com/filipdutescu/renamer.nvim" },
}

function M.setup()
	require("renamer").setup({})

	vim.keymap.set("n", "<leader>ra", function()
		require("renamer").rename({})
	end, { desc = "Renamer Rename word" })
end

return M
