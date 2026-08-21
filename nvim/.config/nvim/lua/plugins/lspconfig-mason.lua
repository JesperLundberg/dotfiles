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

function M.setup()
	setup_diagnostics()

	-- Builtin completion options
	vim.o.autocomplete = true
	vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy" }
	vim.opt.shortmess:append("c")
	vim.lsp.completion.order = {
		"priority",
		"preselect",
		"filterText",
		"label",
		"kind",
		"detail",
	}

	-- Disable autocomplete for non file buffers
	vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
		callback = function()
			vim.opt_local.autocomplete = vim.bo.buftype == "" or vim.bo.buftype == "acwrite"
		end,
	})

	-- 1) LSP servers
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
					telemetry = { enable = true },
				},
			},
		},
	}

	-- 2) Mason registries
	require("mason").setup({
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
	})

	-- 3) Mason tools to install
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

	-- 4) Mason-lspconfig
	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_installation = false,
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.lsp.protocol.make_client_capabilities()
				server.on_attach = server.on_attach

				vim.lsp.config(server_name, server)
				vim.lsp.enable(server_name)
			end,
		},
	})

	-- 5) Enable builtin LSP completion via LspAttach
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp_autocomplete", { clear = true }),
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client and client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, ev.buf, {
					autotrigger = true,
				})
				vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocomplete" })
			end
		end,
	})
end

return M
