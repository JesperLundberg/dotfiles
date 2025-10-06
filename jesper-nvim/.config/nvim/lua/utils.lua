local M = {}

--- Add value to table if it does not already exist
--- @param list table table to add value to
--- @param value any a value to add to the list unless it exists
function M.add_only_unique(list, value)
	for _, v in ipairs(list) do
		if v == value then
			return -- already present
		end
	end
	list[#list + 1] = value
end

return M
