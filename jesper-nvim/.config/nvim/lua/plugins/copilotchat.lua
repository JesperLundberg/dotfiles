return {
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	lazy = false,
	-- 	opts = {
	-- 		suggestion = { enabled = false, auto_trigger = false },
	-- 		panel = { enabled = false },
	-- 	},
	-- },

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			-- "zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
		},
		lazy = "false",
		opts = {
			ui_select = true,
			window = { layout = "float" },
			context = {
				enabled = true,
			},
			filetypes = {
				"*",
			},
			model = "claude-sonnet-4.5",
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Chat" },
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "Explain kod" },
			{ "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "Review kod" },
		},
	},
}
