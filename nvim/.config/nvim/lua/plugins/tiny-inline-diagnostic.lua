local M = {}

M.spec = {
	src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
}

function M.setup()
	require("tiny-inline-diagnostic").setup()
	-- Disable inline virtual text since the plugin handles inline diagnostics
	vim.diagnostic.config({ virtual_text = false })
end

function M.lazy()
	vim.api.nvim_create_autocmd("VimEnter", {
		group = vim.api.nvim_create_augroup("TinyInlineDiagnosticLazy", { clear = true }),
		once = true,
		callback = function()
			pcall(function()
				require("tiny-inline-diagnostic")
			end)
		end,
	})
end

return M
