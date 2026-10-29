local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

-- Load every plugin file exactly once (sorted, so `01-` prefixes control order)
local modules = {}
local specs = {}

for _, file in ipairs(vim.fn.glob(plugins_dir .. "/*.lua", false, true)) do
	local ok, module = pcall(dofile, file)
	if not ok then
		vim.notify("Failed to load " .. file .. ":\n" .. module, vim.log.levels.ERROR)
	elseif type(module) == "table" then
		table.insert(modules, { file = file, module = module })

		local spec = module.spec
		if type(spec) == "table" then
			-- Single spec or a list of specs. Duplicates across files are merged by vim.pack.
			vim.list_extend(specs, spec.src and { spec } or spec)
		end
	end
end

vim.pack.add(specs)

for _, entry in ipairs(modules) do
	if type(entry.module.setup) == "function" then
		local ok, err = pcall(entry.module.setup)
		if not ok then
			vim.notify("Setup failed for " .. entry.file .. ":\n" .. err, vim.log.levels.ERROR)
		end
	end
end

-- Update all plugins
vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Update vim.pack plugins" })

-- Remove plugins that are no longer loaded
vim.api.nvim_create_user_command("PackCleanInactive", function()
	local inactive = {}
	for _, plugin in ipairs(vim.pack.get()) do
		if not plugin.active then
			table.insert(inactive, plugin.spec.name)
		end
	end

	if #inactive > 0 then
		vim.pack.del(inactive)
		print("Deleted " .. #inactive .. " inactive plugins: " .. table.concat(inactive, ", "))
	else
		print("No inactive plugins found")
	end
end, { desc = "Clean inactive vim.pack plugins" })

vim.keymap.set("n", "<leader>Pu", "<cmd>PackUpdate<CR>", { desc = "Pack: Update" })
vim.keymap.set("n", "<leader>Pc", "<cmd>PackCleanInactive<CR>", { desc = "Pack: Clean inactive" })
