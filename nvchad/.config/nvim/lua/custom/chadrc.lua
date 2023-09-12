local M = {}
M.ui = {
	theme = "catppuccin",
	nvdash = {
		load_on_startup = true,

		header = {
			"              It's             ",
			"             ALWAYS            ",
			"         food o'clock!         ",
			"                          ,    ",
			"   ,-.       _,---._ __  / \\   ",
			"  /  )    .-'       `./ /   \\  ",
			" (  (   ,'            `/    /| ",
			"  \\  `-\"             \\'\\   / | ",
			"   `.              ,  \\ \\ /  | ",
			"    /`.          ,'-`----Y   | ",
			"   (            ;        |   ' ",
			"   |  ,-.    ,-'   Cat   |  /  ",
			"   |  | (   |      food  | /   ",
			"   )  |  \\  `.___________|/    ",
			"   `--'   `--'                 ",
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
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
