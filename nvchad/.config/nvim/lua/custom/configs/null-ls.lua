local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.csharpier,
	formatting.stylua,
	formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

	lint.shellcheck,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
