local M = {}

M.spec = {
	src = "https://github.com/lewis6991/gitsigns.nvim",
}

function M.setup()
	require("gitsigns").setup({
		signs = {
			add = { text = "┃" },
			change = { text = "▎" },
			delete = { text = "▎" },
			topdelete = { text = "▎" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
	})

	vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Gitsigns blame line" })
end

return M
