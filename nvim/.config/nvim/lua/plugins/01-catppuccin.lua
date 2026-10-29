local M = {}

M.spec = {
	src = "https://github.com/catppuccin/nvim",
}

function M.setup()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		integrations = {
			treesitter = true,
			gitsigns = true,
			which_key = true,
			snacks = { enabled = true },
			mini = { enabled = true },
		},
		transparent_background = false,
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
