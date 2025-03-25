---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
}

M.nvdash = {
	load_on_startup = true,

	header = {
		"        Coffe into code      ",
		"        ██    ██    ██       ",
		"      ██      ██  ██         ",
		"      ██    ██    ██         ",
		"        ██  ██      ██       ",
		"        ██    ██    ██       ",
		"                             ",
		"    ████████████████████     ",
		"    ██                ██████ ",
		"    ██                ██  ██ ",
		"    ██                ██  ██ ",
		"    ██                ██████ ",
		"      ██            ██       ",
		"  ████████████████████████   ",
		"  ██                    ██   ",
		"    ████████████████████     ",
		"",
	},
}

M.ui = {
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = {
			"mode",
			"file",
			"git",
			"%=",
			"arrow",
			"diagnostics",
			"clients",
			"cwd",
			"cursor",
		},
		modules = {
			-- Override the default cursor module to show the current line and the percentage of the file
			cursor = "%#St_pos_sep#%#St_pos_icon# %#St_pos_text# %l (%p%%) ",

			-- Show the icon and index if the current file is on arrow
			arrow = function()
				local arrow_statusline = require("arrow.statusline")
				arrow_statusline.is_on_arrow_file() -- return nil if current file is not on arrow.  Return the index if it is.
				return "{ " .. arrow_statusline.text_for_statusline_with_icons() .. " }" -- Same, but with an bow and arrow icon ;D
			end,

			-- Show the currently attatched clients (lsps, formatters)
			clients = function()
				local clients = {}
				local buf = vim.api.nvim_get_current_buf()

				-- Iterate through all the clients for the current buffer
				for _, client in pairs(vim.lsp.get_clients({ bufnr = buf })) do
					-- Add the client name to the `clients` table
					table.insert(clients, client.name)
				end

				local conform_ok, conform = pcall(require, "conform")
				if conform_ok then
					local formatters = conform.list_formatters(0)
					for _, formatter in pairs(formatters) do
						table.insert(clients, formatter.name)
					end
				end

				if #clients == 0 then
					return ""
				else
					return (vim.o.columns > 100 and (" %#St_gitIcons#" .. table.concat(clients, ", ") .. " "))
						or "  LSP "
				end
			end,
		},
	},

	-- Disable tabufline
	tabufline = {
		enabled = false,
	},
}

M.mason = { cmd = true, pkgs = { "netcoredbg" } }

return M
