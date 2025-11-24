return {
	{
		"folke/snacks.nvim",
		event = "VimEnter",
		opts = {
			bigfile = { enabled = false },
			dashboard = { enabled = false },
			explorer = { enabled = false },
			indent = { enabled = false },
			input = { enabled = false },
			notifier = { enabled = false },
			quickfile = { enabled = false },
			scope = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			picker = {
				enabled = true,
				reverse = false,
				ui_select = true,
			},
		},
		keys = function()
			local picker = require("snacks").picker
			return {
				{
					"<leader>fh",
					function()
						picker.help()
					end,
					desc = "[f]ind [H]elp",
				},
				{
					"<leader>fk",
					function()
						picker.keymaps()
					end,
					desc = "[f]ind [K]eymaps",
				},
				{
					"<leader>ff",
					function()
						picker.files()
					end,
					desc = "[f]ind [F]iles",
				},
				{
					"<leader>fs",
					function()
						picker.pickers()
					end,
					desc = "[f]ind [S]elect Picker",
				}, -- som telescope.builtin
				{
					"<leader>fw",
					function()
						picker.grep_word()
					end,
					desc = "[f]ind current [W]ord",
					mode = { "n", "x" },
				},
				{
					"<leader>fg",
					function()
						picker.grep()
					end,
					desc = "[f]ind by [G]rep",
				}, -- live grep
				{
					"<leader>fd",
					function()
						picker.diagnostics()
					end,
					desc = "[f]ind [D]iagnostics",
				},
				{
					"<leader>fr",
					function()
						picker.resume()
					end,
					desc = "[f]ind [R]esume",
				},
				{
					"<leader>fo",
					function()
						picker.recent({ filter = { cwd = true } })
					end,
					desc = "[f]ind Recent (cwd)",
				},
				{
					"<leader><leader>",
					function()
						picker.buffers()
					end,
					desc = "[ ] Find existing buffers",
				},

				-- LSP
				{
					"<leader>gr",
					function()
						picker.lsp_references()
					end,
					desc = "LSP: References",
				},
				{
					"<leader>gd",
					function()
						picker.lsp_definitions()
					end,
					desc = "LSP: Definitions",
				},
				{
					"<leader>gi",
					function()
						picker.lsp_implementations()
					end,
					desc = "LSP: Implementations",
				},
				{
					"gO",
					function()
						picker.lsp_symbols()
					end,
					desc = "LSP: Doc Symbols",
				},
				{
					"gW",
					function()
						picker.lsp_workspace_symbols()
					end,
					desc = "LSP: Workspace Symbols",
				},
				{
					"<leader>re",
					function()
						picker.lazy()
					end,
					desc = "Search plugins (Lazy)",
				},
			}
		end,
	},
}
