local M = {}

M.opts = {
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		xmlformat = {
			cmd = { "xmlformat" },
			args = { "--selfclose", "-" },
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
	},
}

return M
