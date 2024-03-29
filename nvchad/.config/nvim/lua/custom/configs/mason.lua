local M = {}

M.opts = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- C# stuff
		"omnisharp",
		"csharpier",

		-- HTML
		"prettier",

		-- xml stuff
		"xmlformat",

		-- yaml
		"yamlfix",
	},
}

return M
