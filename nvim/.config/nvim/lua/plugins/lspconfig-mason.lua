local M = {}

M.spec = {
	-- Core LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- Mason ecosystem
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	-- UI
	-- { src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
}

local function setup_diagnostics()
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
end

-- Reusable on_attach for every LSP client
local function on_attach(client, bufnr)
	local function map(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	map("<leader>ra", vim.lsp.buf.rename, "Rename")
	vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code Action" })

	-- Document highlight (conditioned on provider)
	if client.server_capabilities.documentHighlightProvider then
		local hl = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			group = hl,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
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
	end

	map("<leader>th", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
	end, "[T]oggle Inlay [H]ints")
end

local function setup_blink_cmp()
	require("blink.cmp").setup({
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		fuzzy = { implementation = "lua" },
	})
end

function M.setup()
	setup_diagnostics()
	setup_blink_cmp()

	-- 2) Capabilities
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	-- 3) LSP servers (config only, not `.setup()` calls)
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
	local ensure_installed = vim.tbl_keys(servers)
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

	-- 6) Mason-lspconfig + 0.12 LSP style
	-- Note: mason-lspconfig is still the recommended way to wire Mason + LSP.
	-- Under the hood, it will call vim.lsp.config and vim.lsp.enable.
	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_installation = false,
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				server.on_attach = server.on_attach or on_attach

				-- Use vim.lsp.config for 0.12‑style setup
				vim.lsp.config(server_name, server)
				vim.lsp.enable() -- each server is enabled once
			end,
		},
	})
end

return M
