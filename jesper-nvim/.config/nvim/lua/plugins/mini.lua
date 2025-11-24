return {
	{
		"nvim-mini/mini.jump",
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
		"nvim-mini/mini.surround",
		config = function()
			require("mini.surround").setup({})
		end,
	},
	{
		"nvim-mini/mini.ai",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
		event = "BufRead",
	},
	{
		"nvim-mini/mini.icons",
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		-- File manager
		"nvim-mini/mini.files",
		version = false,
		config = function()
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
		end,
		event = "VeryLazy",
	},

	-- mini.files
	vim.keymap.set("n", "<C-n>", function()
		require("mini.files").open()
	end, { desc = "Mini.files Open file browser" }),
}
