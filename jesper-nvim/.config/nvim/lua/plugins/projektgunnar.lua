return {
	{
		-- Handle dotnet packages and references
		"JesperLundberg/projektgunnar.nvim",
		-- dir = "~/dev/eget/projektgunnar.nvim/",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("projektgunnar").setup({
				prefer = { "telescope" },
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
					require("projektgunnar.main").add_project_to_project()
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
