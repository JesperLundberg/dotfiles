return {
	-- Nicer UI around renaming
	"filipdutescu/renamer.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("renamer").setup()
	end,
	event = "VeryLazy",
	keys = {
		{
			"<leader>ra",
			function()
				require("renamer").rename({})
			end,
			desc = "Renamer Rename word",
		},
	},
}
