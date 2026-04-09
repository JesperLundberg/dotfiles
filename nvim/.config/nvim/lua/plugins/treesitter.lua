local M = {}

M.spec = {
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
}

function M.setup()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"bash",
			"diff",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		},
		-- Autoinstall languages that are not installed (via `:TSInstall`)
		auto_install = true,
	})

	-- Optional: map `:TSUpdate` to run after `vim.pack` update
	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			local name, kind = ev.data.spec.name, ev.data.kind
			if name == "nvim-treesitter" and kind == "update" then
				if not ev.data.active then
					vim.cmd.packadd("nvim-treesitter")
				end
				vim.cmd("TSUpdate")
			end
		end,
	})
end

function M.lazy()
	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("NvimTreesitterLazy", { clear = true }),
		once = true,
		callback = function()
			pcall(function()
				require("nvim-treesitter.configs")
			end)
		end,
	})
end

return M
