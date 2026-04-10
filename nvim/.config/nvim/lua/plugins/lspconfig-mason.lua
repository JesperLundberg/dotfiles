local M = {}

M.spec = {
	-- Core LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- Mason ecosystem
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
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
			callback = function(ev)
				pcall(vim.lsp.buf.clear_references)
				vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = ev.buf })
			end,
		})
	end
end

function M.setup()
	setup_diagnostics()

	-- Builtin completion options
	vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
	vim.opt.shortmess:append("c")
	vim.lsp.completion.order = {
		"priority",
		"preselect",
		"filterText",
		"label",
		"kind",
		"detail",
	}

	-- 1) Capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- 2) LSP servers
	local servers = {
		lua_ls = {
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
					runtime = {
						version = "LuaJIT",
						path = { [[@.luarc.lua]], [[@lua5.1]] },
					},
					diagnostics = {
						globals = { "vim", "use" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						maxPreload = 10000,
						preloadFileSize = 10000,
					},
					telemetry = { enable = false },
				},
			},
		},
	}

	-- 3) Mason registries
	require("mason").setup({
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
	})

	-- 4) Mason tools to install
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

	-- 5) Mason-lspconfig
	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_installation = false,
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = capabilities
				server.on_attach = server.on_attach or on_attach

				vim.lsp.config(server_name, server)
				vim.lsp.enable()
			end,
		},
	})

	-- 6) Enable builtin LSP completion via LspAttach
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp_autocomplete", { clear = true }),
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client == nil then
				return
			end
			if client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, ev.buf, {
					autotrigger = true,
				})
				vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocomplete" })
			end
		end,
	})
end

return M
