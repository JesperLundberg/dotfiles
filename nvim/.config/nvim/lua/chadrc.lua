local M = {}
M.ui = {
	theme = "catppuccin",
	nvdash = {
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
		},

		buttons = {
			{ "  Find Files", "Spc f f", "Telescope find_files" },
			{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
			{ "  Mappings", "Spc c h", "NvCheatsheet" },
		},
	},

	-- Disable tabufline
	tabufline = {
		enabled = false,
	},
}

-- read the custom plugins
M.plugins = "plugins"

-- check core.mappings for table structure
M.mappings = require("mappings")

return M
