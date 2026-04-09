local M = {}

M.spec = {
	src = "https://github.com/folke/which-key.nvim",
}

function M.setup()
	local wk = require("which-key")

	wk.setup({
		-- Delay between pressing a key and opening which-key (ms; independent of `timeoutlen`)
		delay = 0,
		icons = {
			mappings = vim.g.have_nerd_font,
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				BS = "<BS> ",
				Space = "<Space> ",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},
		spec = {
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		},
	})
end

function M.lazy()
	vim.api.nvim_create_autocmd("VimEnter", {
		group = vim.api.nvim_create_augroup("WhichKeyLazy", { clear = true }),
		once = true,
		callback = function()
			pcall(function()
				require("which-key")
			end)
		end,
	})
end

return M
