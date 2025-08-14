return {
	{
		-- Code actions
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		keys = {
			vim.keymap.set({ "n", "x" }, "<leader>ca", function()
				require("tiny-code-action").code_action()
			end, { noremap = true, silent = true }),
		},
		config = function()
			require("tiny-code-action").setup({})
		end,
	},
}
