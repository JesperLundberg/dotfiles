local M = {}

M.spec = {
	{ src = "https://github.com/nvim-mini/mini.nvim" },
}

local function cwd_relative_path()
	local fname = vim.api.nvim_buf_get_name(0)

	if fname == "" then
		return ""
	end

	return vim.fn.fnamemodify(fname, ":.")
end

local function diagnostic_groups()
	local sev = vim.diagnostic.severity
	local counts = vim.diagnostic.count(0)
	local groups = {}

	local function push(severity, icon, hl)
		local count = counts[severity] or 0
		if count > 0 then
			table.insert(groups, {
				hl = hl,
				strings = { ("%s %d"):format(icon, count) },
			})
		end
	end

	push(sev.ERROR, "", "DiagnosticError")
	push(sev.WARN, "", "DiagnosticWarn")
	push(sev.INFO, "", "DiagnosticInfo")
	push(sev.HINT, "", "DiagnosticHint")

	return groups
end

local function get_lsps()
	local clients = {}

	for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
		table.insert(clients, client.name)
	end

	local ok, conform = pcall(require, "conform")

	if ok then
		for _, f in pairs(conform.list_formatters(0)) do
			if not vim.list_contains(clients, f.name) then
				table.insert(clients, f.name)
			end
		end
	end

	if #clients == 0 then
		return ""
	end

	return vim.o.columns > 100 and (table.concat(clients, ", ") .. " ") or "  LSP "
end

local function setup_statusline()
	local statusline = require("mini.statusline")

	statusline.setup({
		use_icons = vim.g.have_nerd_font,

		content = {
			active = function()
				local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

				local groups = {
					{
						hl = mode_hl,
						strings = { mode },
					},
					{
						hl = "MiniStatuslineDevinfo",
						strings = {
							statusline.section_git({ trunc_width = 75 }),
							statusline.section_diff({ trunc_width = 75 }),
						},
					},
					-- This is the point where Vim is allowed to truncate.
					"%<",
					{
						hl = "MiniStatuslineFilename",
						strings = { cwd_relative_path() },
					},
					"%=",
				}

				vim.list_extend(groups, diagnostic_groups())
				vim.list_extend(groups, {
					{
						hl = "MiniStatuslineDevinfo",
						strings = { get_lsps() },
					},
					{
						hl = "MiniStatuslineFilename",
						strings = { vim.bo.filetype },
					},
					{
						hl = mode_hl,
						strings = { "%l/%-L (%p%%)" },
					},
				})

				return statusline.combine_groups(groups)
			end,
		},
	})
end

function M.setup()
	-- mini.jump
	require("mini.jump").setup({
		mappings = {
			repeat_jump = "",
		},
		delay = {
			highlight = 10 ^ 7,
		},
	})

	-- mini.surround
	require("mini.surround").setup()

	-- mini.ai
	require("mini.ai").setup({ n_lines = 500 })

	-- mini.icons
	require("mini.icons").setup()

	-- mini.pairs
	require("mini.pairs").setup()

	-- mini.statusline
	setup_statusline()

	-- mini.files
	require("mini.files").setup({
		mappings = {
			go_in_plus = "<Right>",
			go_out_plus = "<Left>",
			synchronize = "<C-s>",
		},
		windows = {
			width_focus = 80,
		},
	})

	vim.keymap.set("n", "<C-n>", function()
		require("mini.files").open()
	end, { desc = "Mini.files Open file browser" })
end

return M
