local M = {}

M.opts = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- C# stuff
		"omnisharp",
		"csharpier",

		-- Astro
		"astro-language-server",

		-- HTML
		"prettier",

		-- bash stuff
		"shellcheck",
	},
}

return M
