local M = {}

M.spec = {
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
}

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "update" or kind == "install") then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

function M.setup()
	local ts = require("nvim-treesitter")

	ts.install({
		"bash",
		"c_sharp",
		"diff",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
	})

	local function start(buf)
		if pcall(vim.treesitter.start, buf) then
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
		callback = function(ev)
			local lang = vim.treesitter.language.get_lang(ev.match)
			if not lang then
				return
			end

			if vim.treesitter.language.add(lang) then
				start(ev.buf)
			elseif vim.list_contains(ts.get_available(), lang) then
				ts.install(lang):await(function()
					vim.schedule(function()
						if vim.api.nvim_buf_is_valid(ev.buf) and vim.treesitter.language.add(lang) then
							start(ev.buf)
						end
					end)
				end)
			end
		end,
	})
end

return M
