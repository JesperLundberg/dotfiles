local M = {}

M.spec = {
	{ src = "https://github.com/nvim-mini/mini.nvim" },
}

function M.lazy()
	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("MiniLazy", { clear = true }),
		once = true,
		callback = function()
			require("plugins.mini")
		end,
	})
end

function M.setup()
	-- mini.jump
	require("mini.jump").setup({
		mappings = {
			repeat_jump = "",
		},
		delay = {
			highlight = 1000000,
		},
	})

	-- mini.surround
	require("mini.surround").setup({})

	-- mini.ai
	require("mini.ai").setup({ n_lines = 500 })

	-- mini.icons
	require("mini.icons").setup()

	-- mini.files
	require("mini.files").setup({
		mappings = {
			go_in_plus = "<Right>",
			go_out_plus = "<Left>",
			synchronize = "<C-s>",
		},
		windows = {
			width_focus = 80,
		},
	})

	vim.keymap.set("n", "<C-n>", function()
		require("mini.files").open()
	end, { desc = "Mini.files Open file browser" })
end

return M
