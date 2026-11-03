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

	-- Keep the parser list small since parsers are slow to compile.
	-- Only missing parsers are queued, so normal startups do no extra work.
	local wanted = {
		"bash",
		"lua",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
	}
	local missing = vim.tbl_filter(function(lang)
		return not pcall(vim.treesitter.language.add, lang)
	end, wanted)
	if #missing > 0 then
		ts.install(missing)
	end

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

			-- Only highlight with parsers that are already installed;
			-- new ones are never compiled automatically (use :TSInstall).
			if vim.treesitter.language.add(lang) then
				start(ev.buf)
			end
		end,
	})
end

return M
