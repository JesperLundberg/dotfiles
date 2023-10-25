local M = {}

M.opts = {
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	ignore_errors = false,
	formatters = {
		csharpier = {
			command = "dotnet-csharpier",
			args = "--write-stdout",
			stdin = true,
		},
	},
	formatters_by_ft = {
		cs = { "csharpier" },
		lua = { "stylua" },
		markdown = { "prettier", "injected" },
	},
}

return M
