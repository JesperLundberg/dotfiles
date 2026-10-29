local M = {}

M.spec = {
	-- Core LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- Mason ecosystem
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
}

function M.setup()
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.INFO] = " ",
				[vim.diagnostic.severity.HINT] = " ",
			},
		},
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		virtual_text = true,
	})

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
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		group = vim.api.nvim_create_augroup("autocomplete", { clear = true }),
		callback = function()
			vim.opt_local.autocomplete = vim.bo.buftype == ""
				or vim.bo.buftype == "acwrite"
				or vim.bo.filetype == "codecompanion"
		end,
	})

	-- 1) LSP servers
	-- Servers installed through mason-lspconfig are enabled automatically (automatic_enable).
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				completion = { callSnippet = "Replace" },
				runtime = { version = "LuaJIT" },
				workspace = {
					library = { vim.env.VIMRUNTIME },
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	})

	-- 2) Mason registries
	require("mason").setup({
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
	})

	-- 3) Mason tools to install
	local ensure_installed = {
		"lua-language-server",
		"stylua",
		"roslyn",
		"csharpier",
		"netcoredbg",
		"bicep-lsp",
		"prettier",
		"xmlformatter",
		"yamlfix",
	}

	require("mason-tool-installer").setup({
		ensure_installed = ensure_installed,
	})

	-- 4) Mason-lspconfig
	require("mason-lspconfig").setup({
		automatic_enable = { exclude = { "roslyn", "roslyn_ls" } },
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
				vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocomplete" })
			end
		end,
	})
end

return M
