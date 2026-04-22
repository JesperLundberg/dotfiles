local M = {}

M.spec = {
	{ src = "https://github.com/nvim-mini/mini.statusline" },
}

local utils = {}
function utils.add_only_unique(t, item)
	for _, v in ipairs(t) do
		if v == item then
			return
		end
	end
	table.insert(t, item)
end

local function get_filetype()
	local ft = vim.bo.filetype
	return (ft ~= "" and ft) or ""
end

local function get_position()
	return "%l/%-L (%p%%)"
end

local function cwd_relative_path(bufnr)
	bufnr = bufnr or 0
	local fname = vim.api.nvim_buf_get_name(bufnr)
	if fname == "" then
		return ""
	end
	return vim.fn.fnamemodify(fname, ":.")
end

local function diagnostic_groups()
	local sev = vim.diagnostic.severity
	local n_err = #vim.diagnostic.get(0, { severity = sev.ERROR })
	local n_warn = #vim.diagnostic.get(0, { severity = sev.WARN })
	local n_info = #vim.diagnostic.get(0, { severity = sev.INFO })
	local n_hint = #vim.diagnostic.get(0, { severity = sev.HINT })

	if (n_err + n_warn + n_info + n_hint) == 0 then
		return {}
	end

	local groups = {}
	local function push(count, icon, hl)
		if count > 0 then
			table.insert(groups, { hl = hl, strings = { ("%s %d"):format(icon, count) } })
		end
	end

	push(n_err, "", "DiagnosticError")
	push(n_warn, "", "DiagnosticWarn")
	push(n_info, "", "DiagnosticInfo")
	push(n_hint, "", "DiagnosticHint")

	return groups
end

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

function M.setup()
	local statusline = require("mini.statusline")
	statusline.setup({
		use_icons = vim.g.have_nerd_font,
		content = {
			active = function()
				local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
				local groups = {
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
				vim.list_extend(groups, diagnostic_groups())
				vim.list_extend(groups, {
					{ hl = "MiniStatuslineDevinfo", strings = { get_lsps() } },
					{ hl = "MiniStatuslineFilename", strings = { get_filetype() } },
					{ hl = mode_hl, strings = { get_position() } },
				})
				return statusline.combine_groups(groups)
			end,
		},
	})
end

return M
