local M = {}

M.opts = {
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		csharpier = function()
			local useDotnet = not vim.fn.executable("csharpier")

			local command = useDotnet and "dotnet csharpier" or "csharpier"

			local version_out = vim.fn.system(command .. " --version")

			--NOTE: system command returns the command as the first line of the result, need to get the version number on the final line
			local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
			local is_new = major_version >= 1

			local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

			return {
				command = command,
				args = args,
				stdin = not is_new,
				require_cwd = false,
			}
		end,
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
