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

	vim.keymap.set("n", "<leader>lg", function()
		snacks.lazygit()
	end, { desc = "LazyGit" })

	local picker = snacks.picker

	-- File finders
	vim.keymap.set("n", "<leader>fh", function()
		picker.help()
	end, { desc = "[f]ind [H]elp" })
	vim.keymap.set("n", "<leader>fk", function()
		picker.keymaps()
	end, { desc = "[f]ind [K]eymaps" })
	vim.keymap.set("n", "<leader>ff", function()
		picker.files()
	end, { desc = "[f]ind [F]iles" })
	vim.keymap.set("n", "<leader>fs", function()
		picker.pickers()
	end, { desc = "[f]ind S[elect Picker]" })
	vim.keymap.set({ "n", "x" }, "<leader>fw", function()
		picker.grep_word()
	end, { desc = "[f]ind current [W]ord" })
	vim.keymap.set("n", "<leader>fg", function()
		picker.grep()
	end, { desc = "[f]ind by [G]rep" })
	vim.keymap.set("n", "<leader>fd", function()
		picker.diagnostics()
	end, { desc = "[f]ind [D]iagnostics" })
	vim.keymap.set("n", "<leader>fr", function()
		picker.resume()
	end, { desc = "[f]ind [R]esume" })
	vim.keymap.set("n", "<leader>fo", function()
		picker.recent({ filter = { cwd = true } })
	end, { desc = "[f]ind Recent (cwd)" })
	vim.keymap.set("n", "<leader><leader>", function()
		picker.buffers()
	end, { desc = "[ ] Find existing buffers" })

	-- LSP
	vim.keymap.set("n", "<leader>gr", function()
		picker.lsp_references()
	end, { desc = "LSP: References" })
	vim.keymap.set("n", "<leader>gd", function()
		picker.lsp_definitions()
	end, { desc = "LSP: Definitions" })
	vim.keymap.set("n", "<leader>gi", function()
		picker.lsp_implementations()
	end, { desc = "LSP: Implementations" })
	vim.keymap.set("n", "gO", function()
		picker.lsp_symbols()
	end, { desc = "LSP: Doc Symbols" })
	vim.keymap.set("n", "gW", function()
		picker.lsp_workspace_symbols()
	end, { desc = "LSP: Workspace Symbols" })
	vim.keymap.set("n", "<leader>re", function()
		picker.lazy()
	end, { desc = "Search plugins (Lazy)" })
end

return M
