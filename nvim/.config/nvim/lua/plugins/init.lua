local plugins = {
	{ import = "nvchad.blink.lazyspec" },
	{
		"saghen/blink.cmp",
		opts = { completion = { ghost_text = { enabled = false } } },
	},
	-- {
	-- 	-- Notes for project
	-- 	dir = "~/dev/eget/notisnisse.nvim/",
	-- 	dependencies = {
	-- 		"kkharji/sqlite.lua",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	-- Cube scramble generator
	-- 	"JesperLundberg/svartafanan.nvim",
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	-- Cube scramble generator
	-- 	dir = "~/dev/eget/svartafanan.nvim/",
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	-- Pomodoro timer
	-- 	dir = "~/dev/eget/tomat.nvim/",
	-- 	dependencies = {
	-- 		"rcarriga/nvim-notify",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("tomat").setup()
	-- 	end,
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	"JesperLundberg/tomat.nvim",
	-- 	dependencies = {
	-- 		"rcarriga/nvim-notify",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("tomat").setup()
	-- 	end,
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	dir = "~/dev/eget/projektgunnar.nvim/",
	-- 	dependencies = {
	-- 		"echasnovski/mini.pick",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	event = "VeryLazy",
	-- },
	{
		-- Handle dotnet packages and references
		"JesperLundberg/projektgunnar.nvim",
		dependencies = {
			"echasnovski/mini.pick",
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
	},
	{
		-- Delete, change etc does not overwrite clipboard content
		"gbprod/cutlass.nvim",
		opts = {},
		event = "BufRead",
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	config = function()
	-- 		require("configs.lint")
	-- 	end,
	-- 	event = "BufRead",
	-- },
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
		event = "BufRead",
	},
	{
		-- Code formatter
		"stevearc/conform.nvim",
		opts = require("configs.conform").opts,
		event = "BufRead",
	},
	{
		-- Disable nvim-tree that is included in NvChad
		"nvim-tree/nvim-tree.lua",
		enabled = false,
	},
	{
		-- Just to override and set ensure_installed
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.treesitter").opts,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
	},
	{
		-- Setup for lsp and formatting
		"neovim/nvim-lspconfig",

		dependencies = {
			"Hoffs/omnisharp-extended-lsp.nvim",
		},

		-- The setup of the different lsps
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		-- Code actions
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup()
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
	{
		-- Show all todo comments in solution
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		event = "BufRead",
	},
	{
		-- Copilot plugin
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("configs.copilot")
		end,
		event = "InsertEnter",
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
	{
		-- Move lines and blocks of code
		"echasnovski/mini.move",
		version = false,
		config = function()
			require("mini.move").setup({
				options = {
					reindent_linewise = true,
				},
			})
		end,
		event = "BufRead",
	},
	{
		-- Highlight the word under the cursor
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup({})
		end,
		event = "BufRead",
	},
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup({})
		end,
		event = "BufRead",
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
		-- Enables jj and jk commands to exit insert mode
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
		event = "InsertEnter",
	},
	-- {
	-- 	-- Debug Framework
	-- 	"mfussenegger/nvim-dap",
	-- 	dependencies = {
	-- 		"rcarriga/nvim-dap-ui",
	-- 	},
	-- 	config = function()
	-- 		require("configs.nvim-dap")
	-- 	end,
	-- 	event = "LspAttach",
	-- },
	-- {
	-- 	-- UI for debugging
	-- 	"rcarriga/nvim-dap-ui",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-neotest/nvim-nio",
	-- 	},
	-- 	config = function()
	-- 		require("configs.nvim-dap-ui")
	-- 	end,
	-- },
	{
		-- Move between files that are regularly visited
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			-- or if using `mini.icons`
			-- { "echasnovski/mini.icons" },
		},
		opts = {
			show_icons = true,
			leader_key = ";", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
		},
		event = "VeryLazy",
	},
	{
		-- Setup of the unit testing for dotnet
		"Issafalcon/neotest-dotnet",
		config = function()
			require("configs.neotest-dotnet")
		end,
	},
	{
		-- Framework for unit testing
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"Issafalcon/neotest-dotnet",
		},
	},
	{
		"folke/lazydev.nvim",
		event = "LspAttach",
	},
	{
		-- Show errors in the solution
		"folke/trouble.nvim",
		opts = {},
		event = "LspAttach",
	},
	{
		"nvim-lua/plenary.nvim",
	},
}

return plugins
