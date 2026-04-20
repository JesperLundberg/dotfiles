local M = {}

M.spec = {
	src = "https://github.com/stevearc/conform.nvim",
}

function M.setup()
	require("conform").setup({
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			xmlformat = {
				cmd = { "xmlformat" },
				args = { "--selfclose", "-" },
			},
			yamlfix = {
				env = {
					YAMLFIX_WHITELINES = "1",
					YAMLFIX_EXPLICIT_START = "false",
				},
			},
		},
		formatters_by_ft = {
			cs = { "csharpier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			javascript = { "prettier" },
			ts = { "prettier" },
			typescript = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier", "injected" },
			xml = { "xmlformat" },
			yaml = { "yamlfix" },
		},
	})
end

-- Lazy load on BufRead
function M.lazy()
	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("ConformLazy", { clear = true }),
		once = true,
		callback = function()
			require("plugins.conform")
		end,
	})
end

return M
