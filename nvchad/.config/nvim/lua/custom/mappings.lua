-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {},
  n = {
    ["l"] = { "o<ESC>", "newline after cursor" },
    ["L"] = { "O<ESC>", "newline before cursor" },
    -- Window movements
    ["<C-left>"] = { "<C-w>h", "window left" },
    ["<C-right>"] = { "<C-w>l", "window right" },
    ["<C-down>"] = { "<C-w>j", "window down" },
    ["<C-up>"] = { "<C-w>k", "window up" },
  },
  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },
  },
  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
  },
  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "dont copy replaced text", opts = { silent = true } },
  },
}

M.zenmode = {
  n = {
    ["<leader>z"] = {
      function()
        require("zen-mode").toggle({ window = { width = 0.8 } })
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

M.minimove = {
  n = {
    -- command is :lua require("mini.move").move_line('up') [for up]

    -- Keymaps for mini.move are in the setup for the plugin until I solve the issue to put it here
    ["<A-Left>"] = {
      function()
        require("mini.move").move_line("left")
      end,
      "move line left",
    },
    ["<A-Right>"] = {
      function()
        require("mini.move").move_line("right")
      end,
      "move line right",
    },
    ["<A-Down>"] = {
      function()
        require("mini.move").move_line("down")
      end,
      "move line down",
    },
    ["<A-Up>"] = {
      function()
        require("mini.move").move_line("up")
      end,
      "move line up",
    },
  },
  v = {
    -- command is :lua require("mini.move").move('up') [for up]

    -- Keymaps for mini.move are in the setup for the plugin until I solve the issue to put it here
    ["<A-Left>"] = {
      function()
        require("mini.move").move("left")
      end,
      "move selection left",
    },
    ["<A-Right>"] = {
      function()
        require("mini.move").move("right")
      end,
      "move selection right",
    },
    ["<A-Down>"] = {
      function()
        require("mini.move").move("down")
      end,
      "move selection down",
    },
    ["<A-Up>"] = {
      function()
        require("mini.move").move("up")
      end,
      "move selection up",
    },
  },
}
M.trouble = {
  n = {
    ["<leader>ww"] = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "toggle trouble with workspace diagnostics",
      opts = { silent = true, noremap = true },
    },
  },
}

M.dap = {
  -- Debug adapter protocol

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
        require("harpoon.ui").nav_next()
      end,
      "toggle harpoon quick menu",
    },
    ["<C-2>"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "toggle harpoon quick menu",
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
        require("neotest").run.run(vim.fn.expand("%"))
        require("neotest").summary.open()
      end,
      "run tests in current file",
    },
    ["<leader>tdb"] = {
      function()
        -- netcoredbg needs special strategy
        if vim.bo.filetype == "cs" then
          require("neotest").run.run({
            strategy = require("neotest-dotnet.strategies.netcoredbg"),
            is_custom_dotnet_debug = true,
          })
        else -- for all others, use regular dap strategy
          require("neotest").run.run({ strategy = "dap" })
        end
      end,
      "debug nearest test",
    },
  },
}

M.tabufline = {
  plugin = true,
  n = {
    -- cycle through buffers
    ["<tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<S-tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.comment = {
  plugin = true,
  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.lspconfig = {
  plugin = true,
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },
    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },
    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },
    ["<leader>ra"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["<leader>ca"] = {
      function()
        require("actions-preview").code_actions()
        -- vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },
    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },
    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "floating diagnostic",
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },
    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      "lsp formatting",
    },
    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },
    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },
    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },
    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.nvterm = {
  plugin = true,
  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "toggle floating term",
    },
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "toggle horizontal term",
    },
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "toggle vertical term",
    },
  },
  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "toggle floating term",
    },
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "toggle horizontal term",
    },
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "toggle vertical term",
    },
    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new("horizontal")
      end,
      "new horizontal term",
    },
    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new("vertical")
      end,
      "new vertical term",
    },
  },
}

M.whichkey = {
  plugin = true,
  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd("WhichKey")
      end,
      "which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input("WhichKey: ")
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}

M.blankline = {
  plugin = true,
  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd([[normal! _]])
        end
      end,

      "Jump to current_context",
    },
  },
}

M.gitsigns = {
  plugin = true,
  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },
    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
    -- Actions
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

return M
