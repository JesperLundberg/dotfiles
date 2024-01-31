-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {},

  n = {
    ["U"] = { "<C-r>", "Undo" },

    ["l"] = { "o<ESC>", "newline after cursor" },
    ["L"] = { "O<ESC>", "newline before cursor" },

    ["<C-left>"] = { "<C-w>h", "window left" },
    ["<C-right>"] = { "<C-w>l", "window right" },
    ["<C-down>"] = { "<C-w>j", "window down" },
    ["<C-up>"] = { "<C-w>k", "window up" },

    ["<leader>q"] = { "<cmd>q<cr>", "quit focused window" },
    ["<leader>x"] = { "<cmd>bd<cr>", "close current buffer" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },
    ["<C-d>"] = { '<cmd>echo "Use Toggle!"<cr>', "disable killing terminal" },
  },
}

M.projektgunnar = {
  n = {
    ["<leader>pap"] = { "<cmd>AddNugetToProject<cr>", "Add packages to project" },
    ["<leader>par"] = { "<cmd>AddProjectToProject<cr>", "Add project reference to other project" },
    ["<leader>pup"] = { "<cmd>UpdateNugetsInProject<cr>", "Update packages in project" },
    ["<leader>pus"] = { "<cmd>UpdateNugetsInSolution<cr>", "Update packages in solution" },
  },
}

M.zenmode = {
  n = {
    ["<leader>z"] = {
      function()
        require("zen-mode").toggle()
      end,
      "toggle zen mode",
    },
  },
}

M.todocomments = {
  n = {
    ["<leader>tc"] = { "<cmd>TodoTelescope<cr>", "toggle todo comments" },
  },
}

M.minifiles = {
  plugin = true,

  n = {
    ["<C-n>"] = {
      function()
        require("mini.files").open()
      end,
      "open file browser",
    },
    -- find the mappings in the setup of the plugin in plugins.lua
  },
}

M.minimove = {
  n = {
    ["<A-Left>"] = {
      function()
        require("mini.move").move_line "left"
      end,
      "move line left",
    },
    ["<A-Right>"] = {
      function()
        require("mini.move").move_line "right"
      end,
      "move line right",
    },
    ["<A-Down>"] = {
      function()
        require("mini.move").move_line "down"
      end,
      "move line down",
    },
    ["<A-Up>"] = {
      function()
        require("mini.move").move_line "up"
      end,
      "move line up",
    },
  },
  v = {
    ["<A-Left>"] = {
      function()
        require("mini.move").move_selection "left"
      end,
      "move selection left",
    },
    ["<A-Right>"] = {
      function()
        require("mini.move").move_selection "right"
      end,
      "move selection right",
    },
    ["<A-Down>"] = {
      function()
        require("mini.move").move_selection "down"
      end,
      "move selection down",
    },
    ["<A-Up>"] = {
      function()
        require("mini.move").move_selection "up"
      end,
      "move selection up",
    },
  },
}

M.copilot = {
  -- Only here for the cheatsheet
  i = {
    ["<A-l>"] = { "", "complete suggestion from copilot" },
  },
}

M.trouble = {
  n = {
    ["<leader>ww"] = {
      function()
        require("trouble").open "workspace_diagnostics"
      end,
      "toggle trouble with workspace diagnostics",
      opts = { silent = true, noremap = true },
    },
  },
}

M.dap = {
  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "start/continue to next breakpoint",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "step over next line",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "step into method",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "step out of method",
    },
    ["<leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "toggle breakpoint",
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "add file to harpoon",
    },
    ["<leader>hu"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "toggle harpoon quick menu",
    },
    ["<C-1>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "navigate to file 1",
    },
    ["<C-2>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "navigate to file 2",
    },
    ["<C-3>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "navigate to file 3",
    },
    ["<C-4>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "navigate to file 4",
    },
  },
}

M.neotest = {
  n = {
    -- Run tests
    ["<leader>tt"] = {
      function()
        require("neotest").run.run()
      end,
      "run neastest test",
    },
    ["<leader>ta"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
        require("neotest").summary.open()
      end,
      "run tests in current file",
    },
    ["<leader>tdb"] = {
      function()
        require("neotest").run.run { strategy = "dap" }
      end,
      "debug nearest test",
    },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>ca"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "lsp code_action",
    },
  },
}

return M
