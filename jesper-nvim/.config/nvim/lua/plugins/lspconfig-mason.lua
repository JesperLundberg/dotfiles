return {
	-- Lua extras for better typing/completion of the Neovim API
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when `vim.uv` is referenced
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- Core LSP setup with Mason, installers, status UI, and blink.cmp capabilities
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- IMPORTANT: Use mason-org across the entire setup to avoid clashes
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",

			-- Install LSPs/linters/formatters/debuggers declaratively
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Lightweight LSP progress/status
			{ "j-hui/fidget.nvim", opts = {} },

			-- Completion client (we pull LSP capabilities from it)
			"saghen/blink.cmp",
		},
		config = function()
			---------------------------------------------------------------------------
			-- 0) Diagnostic signs (gutter icons) and diagnostic rendering
			---------------------------------------------------------------------------
			local s = vim.diagnostic.severity
			vim.diagnostic.config({
				signs = {
					text = {
						[s.ERROR] = " ",
						[s.WARN] = " ",
						[s.INFO] = " ",
						[s.HINT] = " ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				virtual_text = true,
			})

			---------------------------------------------------------------------------
			-- 1) on_attach: keymaps, inlay hints toggle, and document highlighting
			---------------------------------------------------------------------------
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local function map(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Optional notification for debugging which buffer attached
					vim.notify("LspAttach for " .. vim.api.nvim_buf_get_name(event.buf))

					-- Common LSP actions
					vim.keymap.set(
						{ "n", "x" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = event.buf, desc = "LSP: Code Action" }
					)

					-- Document highlight (references under cursor)
					local hl = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = hl,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = hl,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(ev2)
							pcall(vim.lsp.buf.clear_references)
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = ev2.buf })
						end,
					})

					-- Toggle inlay hints
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end,
			})

			---------------------------------------------------------------------------
			-- 2) Capabilities from blink.cmp so servers advertise completion features
			---------------------------------------------------------------------------
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			---------------------------------------------------------------------------
			-- 3) Declare LSP servers (add more entries as needed)
			---------------------------------------------------------------------------
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							-- You can extend diagnostics/workspace settings here if needed
						},
					},
				},
			}

			---------------------------------------------------------------------------
			-- 4) Mason setup; includes the mason-org registry and an optional community registry
			---------------------------------------------------------------------------
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					-- Community registry for extra packages (keep if you use any of these)
					"github:Crashdummyy/mason-registry",
				},
			})

			---------------------------------------------------------------------------
			-- 5) Install everything via mason-tool-installer
			---------------------------------------------------------------------------
			local ensure_installed = vim.tbl_keys(servers or {})
			-- Add tools (formatters, debuggers, misc language servers)
			vim.list_extend(ensure_installed, {
				-- Lua
				"lua-language-server",
				"stylua",

				-- C#
				"roslyn",
				"csharpier",
				"netcoredbg",

				-- Other tools
				"bicep-lsp",
				"prettier",
				"xmlformatter",
				"yamlfix",
			})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			---------------------------------------------------------------------------
			-- 6) mason-lspconfig handlers: wire up every server with shared capabilities
			---------------------------------------------------------------------------
			require("mason-lspconfig").setup({
				ensure_installed = {}, -- handled by mason-tool-installer
				automatic_installation = false, -- avoid double-installation/conflicts
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
