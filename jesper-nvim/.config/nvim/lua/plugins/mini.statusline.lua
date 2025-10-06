local utils = require("utils")

--- Get the file type string
local function get_filetype()
	local ft = vim.bo.filetype
	return (ft ~= "" and ft) or ""
end

--- Get the position string
local function get_position()
	return "%l/%-L (%p%%)"
end

--- Get the relative path to the current working directory
local function cwd_relative_path(bufnr)
	bufnr = bufnr or 0
	local fname = vim.api.nvim_buf_get_name(bufnr)
	if fname == "" then
		return ""
	end
	return vim.fn.fnamemodify(fname, ":.")
end

--- Create a list of separate diagnostic segments (one per severity)
local function diagnostic_groups()
	local sev = vim.diagnostic.severity
	local n_err = #vim.diagnostic.get(0, { severity = sev.ERROR })
	local n_warn = #vim.diagnostic.get(0, { severity = sev.WARN })
	local n_info = #vim.diagnostic.get(0, { severity = sev.INFO })
	local n_hint = #vim.diagnostic.get(0, { severity = sev.HINT })

	-- Return empty list if no diagnostics
	if (n_err + n_warn + n_info + n_hint) == 0 then
		return {}
	end

	local groups = {}

	local function push(count, icon, hl)
		if count > 0 then
			table.insert(groups, { hl = hl, strings = { ("%s %d"):format(icon, count) } })
		end
	end

	-- Each part gets it's own highlight
	push(n_err, "", "DiagnosticError")
	push(n_warn, "", "DiagnosticWarn")
	push(n_info, "", "DiagnosticInfo")
	push(n_hint, "", "DiagnosticHint")

	return groups
end

--- Gets the active lsps and formatters for current buffer
local function get_lsps()
	local clients, buf = {}, vim.api.nvim_get_current_buf()
	for _, c in pairs(vim.lsp.get_clients({ bufnr = buf })) do
		table.insert(clients, c.name)
	end
	local ok, conform = pcall(require, "conform")
	if ok then
		for _, f in pairs(conform.list_formatters(0)) do
			utils.add_only_unique(clients, f.name)
		end
	end
	if #clients == 0 then
		return ""
	end
	return (vim.o.columns > 100 and (table.concat(clients, ", ") .. " ")) or "  LSP "
end

return {
	{
		"nvim-mini/mini.statusline",
		config = function()
			local statusline = require("mini.statusline")

			statusline.setup({
				use_icons = vim.g.have_nerd_font,
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

						-- Build a table with all groups/sections needed
						local groups = {
							-- Left
							{ hl = mode_hl, strings = { mode } },
							{
								hl = "MiniStatuslineDevinfo",
								strings = {
									statusline.section_git({ trunc_width = 75 }),
									statusline.section_diff({ trunc_width = 75 }),
								},
							},
							{ hl = "MiniStatuslineFilename", strings = { cwd_relative_path(0) } },
							"%=",
						}

						-- Diagnostics as separate segments to enable them to get their own highlights
						vim.list_extend(groups, diagnostic_groups())

						-- Right
						vim.list_extend(groups, {
							{ hl = "MiniStatuslineDevinfo", strings = { get_lsps() } },
							{ hl = "MiniStatuslineFilename", strings = { get_filetype() } },
							{ hl = mode_hl, strings = { get_position() } },
						})

						return statusline.combine_groups(groups)
					end,
				},
			})
		end,
	},
}
