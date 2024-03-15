require("nvchad.mappings")

-- n, v, i, t = mode names
local map = vim.keymap.set

-- General
map("n", "U", "<C-r>", { desc = "General Undo" })
map("n", "l", "o<ESC>", { desc = "General Newline after cursor" })
map("n", "L", "O<ESC>", { desc = "General Newline before cursor" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "General Write current buffer" })

-- Figure out new mappings that work with mac!
-- map("n", "<S>Left", "<C-w>h", { desc = "window left" })
--["<C-left>"] = { "<C-w>h", "window left" },
--["<C-right>"] = { "<C-w>l", "window right" },
--["<C-down>"] = { "<C-w>j", "window down" },
--["<C-up>"] = { "<C-w>k", "window up" },

-- Windowmgmt
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Windowmgmt Quit focused window" })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Windowmgmt Close current buffer" })

-- Terminal
map(
	"n",
	"<C-x>",
	vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
	{ desc = "Terminal Escape terminal mode" }
)
map({ "n", "t" }, "<C-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })

-- ProjektGunnar
map("n", "<leader>pap", "<cmd>AddNugetToProject<cr>", { desc = "ProjektGunnar Add packages to project" })
map("n", "<leader>pup", "<cmd>UpdateNugetsInProject<cr>", { desc = "ProjektGunnar Update packages in project" })
map("n", "<leader>pus", "<cmd>UpdateNugetsInSolution<cr>", { desc = "ProjektGunnar Update packages in solution" })
map("n", "<leader>prp", "<cmd>RemoveNugetFromProject<cr>", { desc = "ProjektGunnar Write current buffer" })
map("n", "<leader>pasp", "<cmd>AddProjectToSolution<cr>", { desc = "ProjektGunnar Add project to solution" })
map(
	"n",
	"<leader>par",
	"<cmd>AddProjectToProject<cr>",
	{ desc = "ProjektGunnar Add project reference to other project" }
)
map(
	"n",
	"<leader>prr",
	"<cmd>RemoveProjectFromProject<cr>",
	{ desc = "ProjektGunnar Remove project reference from project" }
)

-- TodoComments
map("n", "<leader>tc", "<cmd>TodoTelescope<cr>", { desc = "TodoComments Toggle todo comments" })

-- mini.files
map("n", "<C-n>", function()
	require("mini.files").open()
end, { desc = "Mini.files Open file browser" })

-- mini.move
map("n", "<A-Left>", function()
	require("mini.move").move_line("left")
end, { desc = "Mini.move Move line left" })
map("n", "<A-Right>", function()
	require("mini.move").move_line("right")
end, { desc = "Mini.move Move line right" })
map("n", "<A-Up>", function()
	require("mini.move").move_line("up")
end, { desc = "Mini.move Move line up" })
map("n", "<A-Down>", function()
	require("mini.move").move_line("down")
end, { desc = "Mini.move Move line down" })

map("v", "<A-Left>", function()
	require("mini.move").move_selection("left")
end, { desc = "Mini.move Move selection left" })
map("v", "<A-Right>", function()
	require("mini.move").move_selection("right")
end, { desc = "Mini.move Move selection right" })
map("v", "<A-Up>", function()
	require("mini.move").move_selection("up")
end, { desc = "Mini.move Move selection up" })
map("v", "<A-Down>", function()
	require("mini.move").move_selection("down")
end, { desc = "Mini.move Move selection down" })

-- Trouble
map("n", "<leader>ww", function()
	require("trouble").open("workspace_diagnostics")
end, { desc = "Trouble Toggle trouble with workspace diagnostics", silent = true })

-- Harpoon
map("n", "<leader>ha", function()
	require("harpoon"):list():append()
end, { desc = "Harpoon Add file" })
map("n", "<leader>hu", function()
	require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())
end, { desc = "Harpoon Toggle quick menu" })
map("n", "<C-1>", function()
	require("harpoon"):list():select(1)
end, { desc = "Harpoon Navigate to file 1" })
map("n", "<C-2>", function()
	require("harpoon"):list():select(2)
end, { desc = "Harpoon Navigate to file 2" })
map("n", "<C-3>", function()
	require("harpoon"):list():select(3)
end, { desc = "Harpoon Navigate to file 3" })
map("n", "<C-4>", function()
	require("harpoon"):list():select(4)
end, { desc = "Harpoon Navigate to file 4" })

-- Neotest
map("n", "<leader>tt", function()
	require("neotest").run.run()
end, { desc = "Neotest Run nearest test" })
map("n", "<leader>ta", function()
	require("neotest").run.run(vim.fn.expand("%"))
	require("neotest").summary.open()
end, { desc = "Neotest Run all tests in current file" })
map("n", "<leader>tdb", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "Neotest Debug nearest test" })

-- Code actions
map("n", "<leader>ca", function()
	require("actions-preview").code_actions()
end, { desc = "CodeAction Lsp code action" })

-- DAP
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "DAP Start/continue to next breakpoint" })
map("n", "<S-F5>", function()
	require("dap").stop()
end, { desc = "DAP Stop debugging" })
map("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "DAP Step over next line" })
map("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "DAP Step into method" })
map("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "DAP Step out of method" })
map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle breakpoint" })
