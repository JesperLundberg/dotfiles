return {
	{
		"numToStr/FTerm.nvim",
		config = function()
			vim.keymap.set("n", "<C-t>", function()
				require("FTerm").toggle()
			end)
			vim.keymap.set("t", "<C-t>", function()
				require("FTerm").toggle()
			end)
		end,
	},
}
