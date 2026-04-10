local specs = {}
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.glob(plugins_dir .. "/*.lua", "", 1, 1)) do
	if vim.endswith(file, ".lua") then
		local ok, module = pcall(dofile, file)
		if ok and type(module.spec) == "table" then
			local spec_table = module.spec

			-- Single spec OR array → flatten ALL
			local specs_to_add = {}
			if type(spec_table[1]) == "table" then
				specs_to_add = spec_table
			else
				specs_to_add = { spec_table }
			end

			-- Add all valid specs
			for _, spec in ipairs(specs_to_add) do
				if type(spec) == "table" and spec.src and type(spec.src) == "string" then
					table.insert(specs, spec)
				end
			end
		end
	end
end

vim.pack.add(specs, { install = true, start = true })

-- Setup after install
vim.schedule(function()
	for _, file in ipairs(vim.fn.glob(plugins_dir .. "/*.lua", "", 1, 1)) do
		if vim.endswith(file, ".lua") then
			local ok, module = pcall(dofile, file)
			if ok and type(module.setup) == "function" then
				pcall(module.setup)
			end
		end
	end
end)

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update(nil, { start = true })
end, { desc = "Update vim.pack plugins (start=true)" })

vim.api.nvim_create_user_command("PackCleanInactive", function()
	local all_plugins = vim.pack.get()

	-- Filter inactive ones manually
	local inactive_names = {}
	for _, plugin in ipairs(all_plugins) do
		if not plugin.active then
			table.insert(inactive_names, plugin.spec.name)
		end
	end

	if #inactive_names > 0 then
		vim.pack.del(inactive_names)
		print("Deleted " .. #inactive_names .. " inactive plugins")
	else
		print("No inactive plugins found")
	end
end, { desc = "Clean inactive vim.pack plugins" })

-- Bonus keymap
vim.keymap.set("n", "<leader>pu", "<cmd>PackUpdate<CR>", { desc = "Pack Update" })
vim.keymap.set("n", "<leader>pc", "<cmd>PackCleanInactive<CR>", { desc = "Pack Clean Inactive" })
