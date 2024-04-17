local M = {}

M.ensure_installed = {
	-- lua
	"lua-language-server",
	"stylua",

	-- C#
	"omnisharp",
	"csharpier",
	"netcoredbg",

	-- HTML, TS, JS, CSS
	"typescript-language-server",
	"prettier",
	"eslint-lsp",
	"js-debug-adapter",

	-- Markdown
	"marksman",

	-- XML
	"xmlformatter",
}

return M
