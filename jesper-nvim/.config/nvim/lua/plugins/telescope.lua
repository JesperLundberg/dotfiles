return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
				},
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [H]elp" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[f]ind [K]eymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [F]iles" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[f]ind [S]elect Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[f]ind current [W]ord" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[f]ind by [G]rep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[f]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[f]ind [R]esume" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = '[f]ind Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "LSP: References" })
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "LSP: Definitions" })
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "LSP: Implementations" })
			vim.keymap.set("n", "<leader>re", builtin.reloader, { desc = "Reload plugins" })
			vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { desc = "LSP: Doc Symbols" })
			vim.keymap.set("n", "gW", builtin.lsp_dynamic_workspace_symbols, { desc = "LSP: Workspace Symbols" })
		end,
	},
}
