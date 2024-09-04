local M = {}

M.ensure_installed = {
	-- lua
	"lua-language-server",
	"stylua",

	-- C#
	"omnisharp",
	"csharpier",
	"netcoredbg",

	-- Bicep
	"bicep-lsp",

	-- HTML, TS, JS, CSS
	"typescript-language-server",
	"prettier",
	"eslint-lsp",
	"js-debug-adapter",
	"astro-language-server",

	-- Markdown
	"marksman",

	-- XML
	"xmlformatter",
}

return M
