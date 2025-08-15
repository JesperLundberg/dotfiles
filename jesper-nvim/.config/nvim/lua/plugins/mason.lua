return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local servers = {
				lua_ls = {},
				-- roslyn = {},
				-- omnisharp = {},
			}

			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, {
				"lua-language-server",
				"stylua",
				-- "omnisharp",
				"roslyn",
				"csharpier",
				"netcoredbg",
				"bicep-lsp",
				"prettier",
				"xmlformatter",
			})

			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server)
						require("lspconfig")[server].setup({})
					end,
				},
			})
		end,
	},
}
