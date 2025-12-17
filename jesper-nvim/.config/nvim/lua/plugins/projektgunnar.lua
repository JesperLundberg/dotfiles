return {
	{
		-- Handle dotnet packages and references
		"JesperLundberg/projektgunnar.nvim",
		-- dir = "~/dev/eget/projektgunnar.nvim/",
		dependencies = {
			"folke/snacks.nvim",
		},
		config = function()
			require("projektgunnar").setup({
				prefer = { "snacks" },
			})
		end,
		event = "VeryLazy",
		keys = {
			{
				"<leader>pap",
				function()
					require("projektgunnar.main").add_nuget_to_project()
				end,
				desc = "ProjektGunnar Add packages to project",
			},
			{
				"<leader>pup",
				function()
					require("projektgunnar.main").update_nugets_in_project()
				end,
				desc = "ProjektGunnar Update packages in project",
			},
			{
				"<leader>pus",
				function()
					require("projektgunnar.main").update_nugets_in_solution()
				end,
				desc = "ProjektGunnar Update packages in solution",
			},
			{
				"<leader>prp",
				function()
					require("projektgunnar.main").remove_nuget_from_project()
				end,
				desc = "ProjektGunnar Remove nuget from project",
			},
			{
				"<leader>pasp",
				function()
					require("projektgunnar.main").add_project_to_solution()
				end,
				desc = "ProjektGunnar Add project to solution",
			},
			{
				"<leader>par",
				function()
					require("projektgunnar.main").add_project_reference()
				end,
				desc = "ProjektGunnar Add project reference to other project",
			},
			{
				"<leader>prr",
				function()
					require("projektgunnar.main").remove_project_from_project()
				end,
				desc = "ProjektGunnar Remove project reference from project",
			},
		},
	},
}
