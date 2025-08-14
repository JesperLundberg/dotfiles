return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
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

			-- See `:help telescope.builtin`
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
			vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { desc = "LSP: Doc Symbols" })
			vim.keymap.set("n", "gW", builtin.lsp_dynamic_workspace_symbols, { desc = "LSP: Workspace Symbols" })

			-- vim.keymap.set("n", "<leader>gr", function()
			--   require("telescope.builtin").lsp_references()
			-- end, { desc = "LSP: References" })
			-- vim.keymap.set("n", "<leader>gd", function()
			--   require("telescope.builtin").lsp_definitions()
			-- end, { desc = "LSP: Definitions" })
			-- vim.keymap.set("n", "<leader>gi", function()
			--   require("telescope.builtin").lsp_implementations()
			-- end, { desc = "LSP: Implementations" })
			-- vim.keymap.set("n", "gO", function()
			--   require("telescope.builtin").lsp_document_symbols()
			-- end, { desc = "LSP: Doc Symbols" })
			-- vim.keymap.set("n", "gW", function()
			--   require("telescope.builtin").lsp_dynamic_workspace_symbols()
			-- end, { desc = "LSP: WS Symbols" })
			--
			-- Slightly advanced example of overriding default behavior and theme
			-- vim.keymap.set("n", "<leader>/", function()
			--   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
			--   builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
			--     winblend = 10,
			--     previewer = false,
			--   })
			-- end, { desc = "[/] Fuzzily search in current buffer" })
			--
			-- -- It's also possible to pass additional configuration options.
			-- --  See `:help telescope.builtin.live_grep()` for information about particular keys
			-- vim.keymap.set("n", "<leader>s/", function()
			--   builtin.live_grep {
			--     grep_open_files = true,
			--     prompt_title = "Live Grep in Open Files",
			--   }
			-- end, { desc = "[S]earch [/] in Open Files" })
			--
			-- -- Shortcut for searching your Neovim configuration files
			-- vim.keymap.set("n", "<leader>sn", function()
			--   builtin.find_files { cwd = vim.fn.stdpath "config" }
			-- end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
