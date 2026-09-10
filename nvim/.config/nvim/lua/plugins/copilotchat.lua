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

		functions = {
			branchdiff = {
				description = "Get the changes on the current branch compared to origin/main",
				uri = "branchdiff://",
				resolve = function()
					local root = vim.system({
						"git",
						"rev-parse",
						"--show-toplevel",
					}, {
						text = true,
						timeout = 5000,
					}):wait()

					if root.code ~= 0 then
						error("Not inside a Git repository: " .. root.stderr)
					end

					local repo_root = vim.trim(root.stdout)

					-- Make sure we have an up to date origin/main to diff against
					local fetch = vim.system({
						"git",
						"fetch",
						"origin",
						"main",
					}, {
						text = true,
						cwd = repo_root,
						timeout = 10000,
					}):wait()

					if fetch.code ~= 0 then
						error("Failed to fetch origin/main (does the remote/branch exist?): " .. fetch.stderr)
					end

					local result = vim.system({
						"git",
						"diff",
						"origin/main...HEAD",
					}, {
						text = true,
						cwd = repo_root,
						timeout = 5000,
					}):wait()

					if result.code ~= 0 then
						error("git diff failed: " .. result.stderr)
					end

					local data = result.stdout ~= "" and result.stdout
						or "No changes found between origin/main and HEAD."

					return {
						{
							mimetype = "text/plain",
							data = data,
						},
					}
				end,
			},
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
