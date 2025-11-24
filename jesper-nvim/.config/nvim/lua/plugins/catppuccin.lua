return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Change if you prefer another flavour
			background = {
				light = "latte",
				dark = "mocha",
			},

			-- Keep this false to avoid touching terminal palette
			term_colors = false,

			-- Disable dimming and heavy styling to reduce extra highlight groups
			dim_inactive = {
				enabled = false,
			},

			no_italic = true, -- Avoid generating extra italic highlight groups
			no_bold = false, -- You can set this to true as well if you want it even simpler

			-- Empty styles means "do not create extra style variations"
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},

			-- Leave these empty for now; they do not add cost if unused
			color_overrides = {},
			custom_highlights = {},

			-- This is the big "lite mode" part: almost all integrations off
			integrations = {
				-- Core editor
				treesitter = true, -- Keep this if you use treesitter highlight
				native_lsp = { -- Disable all extra LSP styling
					enabled = false,
					virtual_text = {
						errors = {},
						hints = {},
						warnings = {},
						information = {},
					},
					underlines = {
						errors = {},
						hints = {},
						warnings = {},
						information = {},
					},
					inlay_hints = {
						background = false,
					},
				},

				-- You can flip any of these to true later if you miss styling
				cmp = false,
				gitsigns = false,
				nvimtree = false,
				telescope = false,
				notify = false,
				mini = false, -- You are using mini.*, but turning this off keeps things lighter
				mason = false,
				which_key = false,
				indent_blankline = false,
				snacks = false, -- Disable snacks integration for extra speed
				noice = false,
				lsp_trouble = false,
				symbols_outline = false,
				harpoon = false,
				leap = false,
				markdown = false,
				ts_rainbow = false,
				rainbow_delimiters = false,
				navic = false,
				fidget = false,
				overseer = false,
			},

			-- If you want to experiment later:
			-- compile = {
			--   enabled = true,
			--   path = vim.fn.stdpath("cache") .. "/catppuccin",
			--   suffix = "_compiled",
			-- },
		})

		vim.cmd.colorscheme("catppuccin")
	end,

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- 			integrations = {
	-- 				treesitter = true,
	-- 			},
	-- 			transparent_background = false,
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
}
