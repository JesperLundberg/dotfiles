local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-dotnet")
  },
  -- require("neotest-pleary")
})
