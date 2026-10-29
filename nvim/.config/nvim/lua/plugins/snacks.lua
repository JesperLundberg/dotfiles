local M = {}

M.spec = {
	src = "https://github.com/folke/snacks.nvim",
}

function M.setup()
	local snacks = require("snacks")
	snacks.setup({
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			reverse = false,
			ui_select = true,
		},
	})

	local map = vim.keymap.set
	local picker = snacks.picker

	map("n", "<leader>lg", function()
		snacks.lazygit()
	end, { desc = "LazyGit" })

	-- Floating terminal (same look as FTerm: centered, 80% size, single border).
	-- Snacks identifies terminals by cmd + cwd + count, so cwd and count are pinned
	-- to keep exactly one terminal regardless of directory or `[count]<C-t>`.
	local term_cwd
	local function toggle_terminal()
		local opts = {
			count = 1,
			cwd = term_cwd,
			win = {
				position = "float",
				width = 0.8,
				height = 0.8,
				border = "single",
			},
		}

		-- No live terminal: start a new one in the current directory
		if not snacks.terminal.get(nil, vim.tbl_extend("force", opts, { create = false })) then
			term_cwd = vim.fn.getcwd()
			opts.cwd = term_cwd
		end

		snacks.terminal.toggle(nil, opts)
	end
	map("n", "<C-t>", toggle_terminal, { desc = "Toggle terminal" })
	map("t", "<C-t>", toggle_terminal, { desc = "Toggle terminal (term)" })

	-- File finders
	map("n", "<leader>fh", picker.help, { desc = "[f]ind [H]elp" })
	map("n", "<leader>fk", picker.keymaps, { desc = "[f]ind [K]eymaps" })
	map("n", "<leader>ff", picker.files, { desc = "[f]ind [F]iles" })
	map("n", "<leader>fs", picker.pickers, { desc = "[f]ind [S]elect picker" })
	map({ "n", "x" }, "<leader>fw", picker.grep_word, { desc = "[f]ind current [W]ord" })
	map("n", "<leader>fg", picker.grep, { desc = "[f]ind by [G]rep" })
	map("n", "<leader>fd", picker.diagnostics, { desc = "[f]ind [D]iagnostics" })
	map("n", "<leader>fr", picker.resume, { desc = "[f]ind [R]esume" })
	map("n", "<leader>fo", function()
		picker.recent({ filter = { cwd = true } })
	end, { desc = "[f]ind Recent (cwd)" })
	map("n", "<leader><leader>", picker.buffers, { desc = "[ ] Find existing buffers" })

	-- LSP
	map("n", "<leader>gr", picker.lsp_references, { desc = "LSP: References" })
	map("n", "<leader>gd", picker.lsp_definitions, { desc = "LSP: Definitions" })
	map("n", "<leader>gi", picker.lsp_implementations, { desc = "LSP: Implementations" })
	map("n", "gO", picker.lsp_symbols, { desc = "LSP: Doc Symbols" })
	map("n", "gW", picker.lsp_workspace_symbols, { desc = "LSP: Workspace Symbols" })
end

return M
