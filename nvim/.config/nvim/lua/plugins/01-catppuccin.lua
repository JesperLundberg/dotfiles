local M = {}

M.spec = {
	src = "https://github.com/catppuccin/nvim",
}

function M.setup()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		integrations = {
			treesitter = true,
			telescope = { enabled = false },
			blink_cmp = false,
			gitsigns = true,
			which_key = true,
		},
		transparent_background = false,
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
