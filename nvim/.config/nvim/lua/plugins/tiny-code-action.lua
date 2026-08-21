local M = {}

M.spec = {
	-- Dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	-- Main plugin
	{
		src = "https://github.com/rachartier/tiny-code-action.nvim",
	},
}

function M.setup()
	-- Setup tiny-code-action
	require("tiny-code-action").setup({})

	-- Keymaps
	vim.keymap.set({ "n", "x" }, "<leader>ca", function()
		require("tiny-code-action").code_action({})
	end, { noremap = true, silent = true, desc = "Code actions" })
end

return M
