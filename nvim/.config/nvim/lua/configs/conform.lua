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
		yamlfix = {
			-- Adds environment args to the yamlfix formatter
			env = {
				YAMLFIX_WHITELINES = "1", -- Allow 1 empty line
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
}

return M
