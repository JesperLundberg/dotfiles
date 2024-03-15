require("nvchad.mappings")

-- n, v, i, t = mode names
local map = vim.keymap.set

-- General
map("n", "U", "<C-r>", { desc = "Undo" })
map("n", "l", "o<ESC>", { desc = "newline after cursor" })
map("n", "L", "O<ESC>", { desc = "newline before cursor" })

-- Figure out new mappings that work with mac!
map("n", "<S>Left", "<C-w>h", { desc = "window left" })
--["<C-left>"] = { "<C-w>h", "window left" },
--["<C-right>"] = { "<C-w>l", "window right" },
--["<C-down>"] = { "<C-w>j", "window down" },
--["<C-up>"] = { "<C-w>k", "window up" },

map("n", "<leader>q", "<cmd>q<cr>", { desc = "quit focused window" })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "close current buffer" })

map("n", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "escape terminal mode" })

map("n", "<C-s>", "<cmd>w<cr>", { desc = "write current buffer" })

-- Terminal
map({ "n", "t" }, "<C-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })

-- ProjektGunnar
map("n", "<leader>pap", "<cmd>AddNugetToProject<cr>", { desc = "Add packages to project" })
map("n", "<leader>pup", "<cmd>UpdateNugetsInProject<cr>", { desc = "Update packages in project" })
map("n", "<leader>pus", "<cmd>UpdateNugetsInSolution<cr>", { desc = "Update packages in solution" })
map("n", "<leader>prp", "<cmd>RemoveNugetFromProject<cr>", { desc = "write current buffer" })
map("n", "<leader>pasp", "<cmd>AddProjectToSolution<cr>", { desc = "Add project to solution" })
map("n", "<leader>par", "<cmd>AddProjectToProject<cr>", { desc = "Add project reference to other project" })
map("n", "<leader>prr", "<cmd>RemoveProjectFromProject<cr>", { desc = "Remove project reference from project" })

-- TodoComments
map("n", "<leader>tc", "<cmd>TodoTelescope<cr>", { desc = "toggle todo comments" })

-- mini.files
map("n", "<C-n>", function()
	require("mini.files").open()
end, { desc = "Open file browser" })

-- mini.move
map("n", "<A-Left>", function()
	require("mini.move").move_line("left")
end, { desc = "move line left" })
map("n", "<A-Right>", function()
	require("mini.move").move_line("right")
end, { desc = "move line right" })
map("n", "<A-Up>", function()
	require("mini.move").move_line("up")
end, { desc = "move line up" })
map("n", "<A-Down>", function()
	require("mini.move").move_line("down")
end, { desc = "move line down" })

map("v", "<A-Left>", function()
	require("mini.move").move_selection("left")
end, { desc = "move line left" })
map("v", "<A-Right>", function()
	require("mini.move").move_selection("right")
end, { desc = "move line right" })
map("v", "<A-Up>", function()
	require("mini.move").move_selection("up")
end, { desc = "move line up" })
map("v", "<A-Down>", function()
	require("mini.move").move_selection("down")
end, { desc = "move line down" })

-- Trouble
map("n", "<leader>ww", function()
	require("trouble").open("workspace_diagnostics")
end, { desc = "toggle trouble with workspace diagnostics", silent = true })

-- Harpoon
map("n", "<leader>ha", function()
	require("harpoon"):list():append()
end, { desc = "add file to harpoon" })
map("n", "<leader>hu", function()
	require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())
end, { desc = "toggle harpoon quick menu" })
map("n", "<C-1>", function()
	require("harpoon"):list():select(1)
end, { desc = "navigate to file 1" })
map("n", "<C-2>", function()
	require("harpoon"):list():select(2)
end, { desc = "navigate to file 2" })
map("n", "<C-3>", function()
	require("harpoon"):list():select(3)
end, { desc = "navigate to file 3" })
map("n", "<C-4>", function()
	require("harpoon"):list():select(4)
end, { desc = "navigate to file 4" })

-- Neotest
map("n", "<leader>tt", function()
	require("neotest").run.run()
end, { desc = "run nearest test" })
map("n", "<leader>ta", function()
	require("neotest").run.run(vim.fn.expand("%"))
	require("neotest").summary.open()
end, { desc = "run all tests in current file" })
map("n", "<leader>tdb", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "debug nearest test" })

-- Code actions
map("n", "<leader>ca", function()
	require("actions-preview").code_actions()
end, { desc = "lsp code action" })

-- DAP
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "start/continue to next breakpoint" })
map("n", "<S-F5>", function()
	require("dap").stop()
end, { desc = "stop debugging" })
map("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "step over next line" })
map("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "step into method" })
map("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "step out of method" })
map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "toggle breakpoint" })
