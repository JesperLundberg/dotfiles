local plugins = {
	{
		-- Setup for lsp and formatting
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		-- The setup of the different lsps
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		-- Enables jj and jk commands to exit insert mode
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
		lazy = false,
	},
	{
		-- Debug Framework
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("custom.configs.nvim-dap")
		end,
	},
	{
		-- Used with neotest
		"nvim-lua/plenary.nvim",
	},
	{
		-- To be able to mark often used files and easily get back to them
		"ThePrimeagen/harpoon",
	},
	{
		-- Setup of the unit testing for dotnet
		"Issafalcon/neotest-dotnet",
		config = function()
			require("custom.configs.neotest-dotnet")
		end,
	},
	{
		-- Framework for unit testing
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"Issafalcon/neotest-dotnet",
		},
	},
	{
		-- Api completion - does not work with symlinks?!
		"folke/neodev.nvim",
		config = function()
			require("custom.configs.neodev")
		end,
	},
	{
		-- UI for debugging
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("custom.configs.nvim-dap-ui")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("custom.configs.trouble")
		end,
	},
}

return plugins
