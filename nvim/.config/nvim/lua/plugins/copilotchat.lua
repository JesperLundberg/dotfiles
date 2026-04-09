local M = {}

M.spec = {
	-- Dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	-- Main plugin
	{
		src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
		version = "main",
	},
}

function M.setup()
	require("CopilotChat").setup({
		ui_select = true,
		window = { layout = "float" },
		context = { enabled = true },
		filetypes = { "*" },
		model = "claude-sonnet-4.5",
	})

	-- Keymaps
	vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Chat" })
	vim.keymap.set("n", "<leader>cce", "<cmd>CopilotChatExplain<CR>", { desc = "Explain kod" })
	vim.keymap.set("n", "<leader>ccr", "<cmd>CopilotChatReview<CR>", { desc = "Review kod" })
end

return M
