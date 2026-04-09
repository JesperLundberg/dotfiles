local M = {}

M.spec = {
	-- Core LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- Mason ecosystem
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	-- UI
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
}

function M.setup()
	-- 0) Diagnostics
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

	-- 1) LspAttach keymaps + highlights
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			-- Only use highlights and such if there's an lsp that can provide highlights
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if not client or not client.server_capabilities.documentHighlightProvider then
				return
			end

			local function map(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			vim.notify("LspAttach for " .. vim.api.nvim_buf_get_name(event.buf))

			map("<leader>ra", vim.lsp.buf.rename, "Rename")

			vim.keymap.set(
				{ "n", "x" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ buffer = event.buf, desc = "LSP: Code Action" }
			)

			-- Document highlight
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

			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end,
	})

	require("blink.cmp").setup({
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		fuzzy = { implementation = "lua" }, -- Clean, no warnings
	})

	-- 2) Capabilities
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	-- 3) LSP servers
	local servers = {
		lua_ls = {
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
				},
			},
		},
	}

	-- 4) Mason
	require("mason").setup({
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
	})

	-- 5) Mason tools
	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"lua-language-server",
		"stylua",
		"roslyn",
		"csharpier",
		"netcoredbg",
		"bicep-lsp",
		"prettier",
		"xmlformatter",
		"yamlfix",
	})
	require("mason-tool-installer").setup({
		ensure_installed = ensure_installed,
	})

	-- 6) Mason-lspconfig
	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_installation = false,
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
	})
end

return M
