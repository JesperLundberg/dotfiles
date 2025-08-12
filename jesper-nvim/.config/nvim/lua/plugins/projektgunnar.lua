return {
	{
		-- Handle dotnet packages and references
		"JesperLundberg/projektgunnar.nvim",
		dependencies = {
			"echasnovski/mini.pick",
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
	},
}
