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

--- Get the entire segment for diagnostics with colours based on highest severity
-- TODO: Break this and colour each part according to it's own severity
local function segment_for_statusline()
	local sev = vim.diagnostic.severity
	local n_err = #vim.diagnostic.get(0, { severity = sev.ERROR })
	local n_warn = #vim.diagnostic.get(0, { severity = sev.WARN })
	local n_info = #vim.diagnostic.get(0, { severity = sev.INFO })
	local n_hint = #vim.diagnostic.get(0, { severity = sev.HINT })

	if (n_err + n_warn + n_info + n_hint) == 0 then
		return { hl = "", strings = { "" } }
	end

	-- Choose highlight based on highest severity
	local hl = (n_err > 0 and "DiagnosticError")
		or (n_warn > 0 and "DiagnosticWarn")
		or (n_info > 0 and "DiagnosticInfo")
		or "DiagnosticHint"

	-- Build a string containing all severities and their numbers
	local parts = {}
	if n_err > 0 then
		table.insert(parts, (" %d"):format(n_err))
	end
	if n_warn > 0 then
		table.insert(parts, (" %d"):format(n_warn))
	end
	if n_info > 0 then
		table.insert(parts, (" %d"):format(n_info))
	end
	if n_hint > 0 then
		table.insert(parts, (" %d"):format(n_hint))
	end

	-- parts is never empty
	return { hl = hl, strings = { table.concat(parts, "  ") } }
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
			table.insert(clients, f.name)
		end
	end
	if #clients == 0 then
		return ""
	end
	return (vim.o.columns > 100 and (table.concat(clients, ", ") .. " ")) or "  LSP "
end

return {
	{
		"echasnovski/mini.statusline",
		config = function()
			local statusline = require("mini.statusline")

			-- Set the actual statusline
			statusline.setup({
				use_icons = vim.g.have_nerd_font,
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

						return statusline.combine_groups({
							-- Left
							{ hl = mode_hl, strings = { mode } },
							{
								hl = "MiniStatuslineDevinfo",
								strings = {
									statusline.section_git({ trunc_width = 75 }),
									statusline.section_diff({ trunc_width = 75 }),
								},
							},
							{ hl = "MiniStatuslineFilename", strings = { cwd_relative_path(0) } }, -- Buffer 0 is the active buffer
							"%=",
							-- Right
							segment_for_statusline(),
							{ hl = "MiniStatuslineDevinfo", strings = { get_lsps() } },
							{ hl = "MiniStatuslineFilename", strings = { get_filetype() } },
							{ hl = mode_hl, strings = { get_position() } },
						})
					end,
				},
			})
		end,
	},
	{
		"echasnovski/mini.jump",
		version = false,
		config = function()
			require("mini.jump").setup({
				mappings = {
					-- Do not override Arrow mapping
					repeat_jump = "",
				},
				delay = {
					-- Delay between jump and highlighting all possible jumps
					-- Basically disable as I don't like the look
					highlight = 1000000,
				},
			})
		end,
		event = "BufRead",
	},
	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup({})
		end,
	},
	{
		"echasnovski/mini.ai",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},
	{
		"echasnovski/mini.icons",
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		-- File manager
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup({
				mappings = {
					go_in_plus = "<Right>",
					go_out_plus = "<Left>",
					synchronize = "<C-s>",
				},
			})
		end,
		event = "VeryLazy",
	},

	-- mini.files
	vim.keymap.set("n", "<C-n>", function()
		require("mini.files").open()
	end, { desc = "Mini.files Open file browser" }),
}
