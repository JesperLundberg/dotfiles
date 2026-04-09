local M = {}

M.spec = {
	-- Dependency
	{ src = "https://github.com/folke/snacks.nvim" },
	-- Main plugin (local dev install)
	-- { src = "~/dev/eget/projektgunnar.nvim" }, -- Your local repo
}

-- Keymaps
function M.setup()
	require("projektgunnar").setup({
		prefer = { "snacks" },
	})

	-- NuGet package management
	vim.keymap.set("n", "<leader>pap", function()
		require("projektgunnar.main").add_nuget_to_project()
	end, { desc = "ProjektGunnar Add packages to project" })

	vim.keymap.set("n", "<leader>pup", function()
		require("projektgunnar.main").update_nugets_in_project()
	end, { desc = "ProjektGunnar Update packages in project" })

	vim.keymap.set("n", "<leader>pus", function()
		require("projektgunnar.main").update_nugets_in_project()
	end, { desc = "ProjektGunnar Update packages in solution" })

	vim.keymap.set("n", "<leader>prp", function()
		require("projektgunnar.main").remove_nuget_from_project()
	end, { desc = "ProjektGunnar Remove nuget from project" })

	-- Project/solution management
	vim.keymap.set("n", "<leader>pasp", function()
		require("projektgunnar.main").add_project_to_solution()
	end, { desc = "ProjektGunnar Add project to solution" })

	vim.keymap.set("n", "<leader>par", function()
		require("projektgunnar.main").add_project_reference()
	end, { desc = "ProjektGunnar Add project reference to other project" })

	vim.keymap.set("n", "<leader>prr", function()
		require("projektgunnar.main").remove_project_from_project()
	end, { desc = "ProjektGunnar Remove project reference from project" })
end

return M
