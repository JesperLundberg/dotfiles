local M = {}

M.spec = {
	{ src = "https://www.github.com/olimorris/codecompanion.nvim" },
	-- Depedencies
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
}

function M.setup()
	-- Change this one value to switch the model everywhere
	local adapter = { name = "copilot", model = "claude-sonnet-5.5" }

	require("codecompanion").setup({
		interactions = {
			chat = { adapter = adapter },
			inline = { adapter = adapter },
		},
		display = {
			chat = {
				window = {
					layout = "float",
					border = "rounded",
					height = 0.9,
					width = 0.9,
					opts = {
						number = false,
						relativenumber = false,
						signcolumn = "no",
						foldcolumn = "0",
					},
				},
			},
		},
	})

	-- Native autocomplete in the chat buffer (#, /, @ triggers).
	-- CodeCompanion sets 'omnifunc' itself; 'complete' needs "o" so autocomplete uses it.
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("codecompanion_autocomplete", { clear = true }),
		pattern = "codecompanion",
		callback = function()
			vim.opt_local.complete = "o"
			vim.opt_local.autocomplete = true
		end,
	})

	local map = vim.keymap.set

	-- Action palette
	map({ "n", "v" }, "<leader>cp", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion: Actions" })

	-- Toggle chat buffer
	map({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanion: Toggle chat" })

	-- Send visual selection to chat
	map("v", "<leader>cs", "<cmd>CodeCompanionChat Add<cr>", { desc = "CodeCompanion: Add selection to chat" })

	-- Inline prompt (works in normal and visual mode)
	map({ "n", "v" }, "<leader>ci", ":CodeCompanion ", { desc = "CodeCompanion: Inline prompt" })
end

return M
