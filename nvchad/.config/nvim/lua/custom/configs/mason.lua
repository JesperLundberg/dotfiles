local M = {}

M.opts = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua",

		-- C#
		"omnisharp",
		"csharpier",

		-- HTML
		"prettier",

		-- Markdown
		"marksman",
	},
}

return M
