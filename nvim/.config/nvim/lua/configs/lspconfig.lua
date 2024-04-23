local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

local data_path = vim.fn.stdpath("data")

-- Activate LSPs
local servers = { "marksman", "tsserver" }
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilites = capabilities,
		on_init = on_init,
	})
end

lspconfig.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsonconfig.json", ".git"),
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[data_path .. "/lazy/ui/nvchad_types"] = true,
					[data_path .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

lspconfig.omnisharp.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "dotnet", data_path .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
	settings = {
		FormattingOptions = {
			--         -- Enables support for reading code style, naming convention and analyzer
			--         -- settings from .editorconfig.
			EnableEditorConfigSupport = true,
			--         -- Specifies whether 'using' directives should be grouped and sorted during
			--         -- document formatting.
			OrganizeImports = true,
		},
		MsBuild = {
			--         -- If true, MSBuild project system will only load projects for files that
			--         -- were opened in the editor. This setting is useful for big C# codebases
			--         -- and allows for faster initialization of code navigation features only
			--         -- for projects that are relevant to code that is being edited. With this
			--         -- setting enabled OmniSharp may load fewer projects and may thus display
			--         -- incomplete reference lists for symbols.
			LoadProjectsOnDemand = nil,
		},
		RoslynExtensionsOptions = {
			--         -- Enables support for roslyn analyzers, code fixes and rulesets.
			EnableAnalyzersSupport = true,
			--         -- Enables support for showing unimported types and unimported extension
			--         -- methods in completion lists. When committed, the appropriate using
			--         -- directive will be added at the top of the current file. This option can
			--         -- have a negative impact on initial completion responsiveness,
			--         -- particularly for the first few completion sessions after opening a
			--         -- solution.
			EnableImportCompletion = true,
			--         -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			--         -- true
			AnalyzeOpenDocumentsOnly = nil,
		},
		Sdk = {
			--         -- Specifies whether to include preview versions of the .NET SDK when
			--         -- determining which version to use for project loading.
			IncludePrereleases = true,
		},
	},
})
