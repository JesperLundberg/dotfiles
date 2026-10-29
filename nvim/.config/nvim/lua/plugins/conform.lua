local M = {}

M.spec = {
	src = "https://github.com/stevearc/conform.nvim",
}

function M.setup()
	require("conform").setup({
		format_on_save = {
			timeout_ms = 2000,
			lsp_format = "fallback",
		},
		formatters = {
			xmlformat = {
				cmd = { "xmlformat" },
				args = { "--selfclose-space", "--selfclose", "-" },
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
			lua = { "stylua" },
			markdown = { "prettier", "injected" },
			xml = { "xmlformat" },
			yaml = { "yamlfix" },
		},
	})
end

return M
