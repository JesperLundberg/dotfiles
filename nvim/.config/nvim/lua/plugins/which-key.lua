local M = {}

M.spec = {
	src = "https://github.com/folke/which-key.nvim",
}

function M.setup()
	require("which-key").setup({
		-- Delay between pressing a key and opening which-key (ms; independent of `timeoutlen`)
		delay = 0,
		spec = {
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>g", group = "[G]o to / git" },
			{ "<leader>c", group = "[C]ode / AI" },
			{ "<leader>p", group = "[P]rojektGunnar" },
			{ "<leader>P", group = "[P]ack" },
			{ "<leader>o", group = "[O]pen" },
			{ "<leader>l", group = "[L]azyGit" },
			{ "<leader>r", group = "[R]ename" },
		},
	})
end

return M
