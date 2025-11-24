return {
	{
		-- Code formatter
		"stevearc/conform.nvim",
		opts = function(_, opts)
			local my_opts = {
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters = {
					csharpier = function()
						local useDotnet = not vim.fn.executable("csharpier")
						local command = useDotnet and "dotnet csharpier" or "csharpier"
						local args = { "format", "$FILENAME" } or { "--write-stdout" }
						return {
							command = command,
							args = args,
							stdin = false,
							require_cwd = false,
						}
					end,
					xmlformat = {
						cmd = { "xmlformat" },
						args = { "--selfclose", "-" },
					},
					yamlfix = {
						env = {
							YAMLFIX_WHITELINES = "1", -- Allow 1 empty line
							YAMLFIX_EXPLICIT_START = "false", -- Do not start file with --- at the top
						},
					},
				},
				formatters_by_ft = {
					cs = { "csharpier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					javascript = { "prettier" },
					ts = { "prettier" },
					typescript = { "prettier" },
					lua = { "stylua" },
					markdown = { "prettier", "injected" },
					xml = { "xmlformat" },
					yaml = { "yamlfix" },
				},
			}
			return vim.tbl_deep_extend("force", opts, my_opts)
		end,
		event = "BufRead",
	},
}
