return {
	"seblyng/roslyn.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		broad_search = true,
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern("*.sln")(fname)
				or require("lspconfig.util").root_pattern("*.csproj")(fname)
				or require("lspconfig.util").root_pattern(".git")(fname)
		end,
	},
	-- "seblyng/roslyn.nvim",
	-- opts = {},
	-- lazy = false,
}
