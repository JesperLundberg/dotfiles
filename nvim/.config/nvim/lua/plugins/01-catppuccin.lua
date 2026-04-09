local M = {}

M.spec = {
	src = "https://github.com/catppuccin/nvim",
}

function M.setup()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		integrations = {
			treesitter = true,
			telescope = { enabled = true },
			blink_cmp = true, -- Adjust if using different cmp
			gitsigns = true,
			which_key = true,
		},
		transparent_background = false,
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
