local M = {}

M.spec = {
	-- Dependency
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	-- Plugin
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
}

function M.setup()
	vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
end

return M
