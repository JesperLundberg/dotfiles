local M = {}

M.spec = {
	src = "https://github.com/seblyng/roslyn.nvim",
}

function M.setup()
	require("roslyn").setup({
		broad_search = true,
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern("*.sln")(fname)
				or require("lspconfig.util").root_pattern("*.csproj")(fname)
				or require("lspconfig.util").root_pattern(".git")(fname)
		end,
	})
end

function M.lazy()
	vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
		group = vim.api.nvim_create_augroup("RoslynLazy", { clear = true }),
		pattern = { "*.cs" },
		once = true,
		callback = function()
			require("plugins.roslyn")
		end,
	})
end

return M
