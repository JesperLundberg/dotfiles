return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		lazy = false,
		opts = {
			suggestion = { enabled = true, auto_trigger = true },
			panel = { enabled = false },
			filetypes = {
				lua = true,
				csharp = true,
			},
		},
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
		},
		opts = {
			ui_select = true,
			window = { layout = "float" },
			context = {
				enabled = false,
			},
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Chat" },
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "Explain kod" },
			{ "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "Review kod" },
		},
	},
}
