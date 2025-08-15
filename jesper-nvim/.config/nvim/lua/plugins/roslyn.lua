return {
	"seblyng/roslyn.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		broad_search = true,
		ignore_target = function(sln)
			return string.match(sln, "SmartDok.sln") ~= nil
		end,
	},
	-- "seblyng/roslyn.nvim",
	-- opts = {},
	-- lazy = false,
}
