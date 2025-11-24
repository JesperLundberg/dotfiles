return {
	{
		-- Enables jj and jk commands to exit insert mode
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
		event = "InsertEnter",
	},
	{
		-- Delete, change etc does not overwrite clipboard content
		"gbprod/cutlass.nvim",
		opts = {},
		event = "BufRead",
	},
}
