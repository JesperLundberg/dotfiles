local M = {}

M.opts = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua",

		-- C#
		"omnisharp",
		"csharpier",
		"netcoredbg",

		-- HTML
		"prettier",

		-- Markdown
		"marksman",

		-- XML
		"xmlformatter",
	},
}

return M
