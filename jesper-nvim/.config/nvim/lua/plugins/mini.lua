return {

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
		"echasnovski/mini.statusline",
		config = function()
			local statusline = require("mini.statusline")

			-- Overwrite certain helpers
			--- @diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%l/%-L (%p%%)"
			end

			--- @diagnostic disable-next-line: duplicate-set-field
			statusline.section_lsp = function()
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

			statusline.section_filetype = function()
				local ft = vim.bo.filetype
				return (ft ~= "" and ft) or ""
			end

			local function cwd_relative_path(bufnr)
				bufnr = bufnr or 0
				local fname = vim.api.nvim_buf_get_name(bufnr)
				if fname == "" then
					return ""
				end
				return vim.fn.fnamemodify(fname, ":.")
			end

			-- Diagnostic part

			-- Diagnostic part (clean)
			local function diag_segment_for_statusline()
				local sev = vim.diagnostic.severity
				local n_err = #vim.diagnostic.get(0, { severity = sev.ERROR })
				local n_warn = #vim.diagnostic.get(0, { severity = sev.WARN })
				local n_hint = #vim.diagnostic.get(0, { severity = sev.HINT })

				if (n_err + n_warn + n_hint) == 0 then
					return { hl = "", strings = { "" } } -- nothing to show; mini.statusline ignores nil
				end

				-- Choose highlight based on highest severity
				local hl = (n_err > 0 and "DiagnosticError") or (n_warn > 0 and "DiagnosticWarn") or "DiagnosticHint"

				-- Build a string containing all severities and their numbers
				local parts = {}
				if n_err > 0 then
					table.insert(parts, (" %d"):format(n_err))
				end
				if n_warn > 0 then
					table.insert(parts, (" %d"):format(n_warn))
				end
				if n_hint > 0 then
					table.insert(parts, ("̶ %d"):format(n_hint))
				end

				-- parts is never empty
				return { hl = hl, strings = { table.concat(parts, "  ") } }
			end

			-- Set the actual statusline
			statusline.setup({
				use_icons = vim.g.have_nerd_font,
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

						-- Use the current buffer (0)
						local filename = cwd_relative_path(0)

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
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=",
							-- Right
							diag_segment_for_statusline(),
							{ hl = "MiniStatuslineDevinfo", strings = { statusline.section_lsp() } },
							{ hl = "MiniStatuslineFilename", strings = { statusline.section_filetype() } },
							{ hl = mode_hl, strings = { statusline.section_location() } },
						})
					end,
				},
			})
		end,
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
