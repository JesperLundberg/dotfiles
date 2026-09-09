local M = {}

M.spec = {
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
	-- Depedencies
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
}

function M.setup()
	require("copilot").setup()
	local chat = require("CopilotChat")

	chat.setup({
		-- Optional: pick a default model your org allows (e.g. "gpt-4o", "claude-sonnet-4-5", etc.)
		model = "claude-sonnet-5",

		window = {
			layout = "float", -- or "vertical", "horizontal"
			width = 0.45,
			height = 0.6,
		},

		mappings = {
			submit = "<CR>",
			close = { normal = "q", insert = "<C-c>" },
			reset = "<C-l>",
		},
	})

	vim.keymap.set("n", "<leader>cc", function()
		chat.open()
	end, { desc = "Open Copilot Chat" })

	vim.keymap.set("n", "<leader>cx", function()
		chat.toggle()
	end, { desc = "Toggle Copilot Chat" })

	-- Send visual selection to chat
	vim.keymap.set("v", "<leader>cc", function()
		chat.send({ selection = true })
	end, { desc = "Send selection to Copilot Chat" })
end

return M
