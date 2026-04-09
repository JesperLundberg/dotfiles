local M = {}

M.spec = {
	-- Dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	-- Main plugin
	{
		src = "https://github.com/rachartier/tiny-code-action.nvim",
	},
}

function M.setup()
	-- Setup tiny-code-action
	require("tiny-code-action").setup({})

	-- Keymaps (same as your lazy spec)
	vim.keymap.set({ "n", "x" }, "<leader>ca", function()
		require("tiny-code-action").code_action({})
	end, { noremap = true, silent = true, desc = "Code actions" })
end

-- Lazy‑load on LspAttach
function M.lazy()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("TinyCodeActionLazy", { clear = true }),
		callback = function()
			-- Ensure the plugin is available and loaded
			pcall(function()
				require("tiny-code-action")
			end)
		end,
	})
end

return M
