local M = {}

M.spec = {
	{
		src = "https://github.com/max397574/better-escape.nvim",
	},
	{
		src = "https://github.com/gbprod/cutlass.nvim",
	},
}

function M.setup()
	require("better_escape").setup({
		-- Default config is fine; you can add overrides here if needed
	})
end

function M.better_escape_lazy()
	vim.api.nvim_create_autocmd("InsertEnter", {
		group = vim.api.nvim_create_augroup("BetterEscapeLazy", { clear = true }),
		callback = function()
			pcall(function()
				require("better_escape")
			end)
		end,
	})
end

function M.cutlass_lazy()
	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("CutlassLazy", { clear = true }),
		once = true,
		callback = function()
			pcall(function()
				require("cutlass")
			end)
		end,
	})
end

function M.lazy()
	M.better_escape_lazy()
	M.cutlass_lazy()
end

return M
