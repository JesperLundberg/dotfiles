local M = {}
 M.ui = {theme = 'catppuccin'}

 -- read the custom plugins
 M.plugins = 'custom.plugins'

 -- check core.mappings for table structure
 M.mappings = require "custom.mappings"

return M
