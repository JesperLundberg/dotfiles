local M = {}

M.spec = {
	src = "https://github.com/numToStr/FTerm.nvim",
}

function M.setup()
	vim.keymap.set("n", "<C-t>", function()
		require("FTerm").toggle()
	end, { desc = "Toggle terminal" })

	vim.keymap.set("t", "<C-t>", function()
		require("FTerm").toggle()
	end, { desc = "Toggle terminal (term)" })
end

return M
