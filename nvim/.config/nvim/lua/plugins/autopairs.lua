local M = {}

M.spec = {
	src = "https://github.com/windwp/nvim-autopairs",
}

function M.setup() end

function M.lazy()
	vim.api.nvim_create_autocmd({ "InsertEnter" }, {
		group = vim.api.nvim_create_augroup("nvim-autopairs", { clear = true }),
		once = true,
		callback = function()
			require("plugins.autopairs")
		end,
	})
end

return M
