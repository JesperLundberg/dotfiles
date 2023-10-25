local mason = require "custom.configs.mason"
local treesitter = require "custom.configs.treesitter"

local plugins = {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = require("custom.configs.conform").opts,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    -- Focus and center the buffer
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end,
  },
  {
    -- Movement plugin
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    event = "VeryLazy",
  },
  {
    -- Just to override and set ensure_installed
    "nvim-treesitter/nvim-treesitter",
    opts = treesitter.opts,
  },
  {
    -- Just to override and set ensure_installed
    "williamboman/mason.nvim",
    opts = mason.opts,
  },
  {
    -- Code actions in telescope
    "aznhe21/actions-preview.nvim",
    config = function() end,
    event = "VeryLazy",
  },
  {
    -- Show all todo comments in solution
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    event = "VeryLazy",
  },
  {
    -- Copilot plugin
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",

    config = function()
      require "custom.configs.copilot"
    end,
  },
  {
    -- File manager
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("core.utils").load_mappings "minifiles"
      require("mini.files").setup {
        mappings = {
          go_in = "<Right>",
          go_out = "<Left>",
          synchronize = "<C-s>",
        },
      }
    end,
    event = "VeryLazy",
  },
  {
    -- Move lines and blocks of code
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup {
        options = {
          reindent_linewise = true,
        },
      }
    end,
    event = "VeryLazy",
  },
  {
    -- Highlight the word under the cursor
    "echasnovski/mini.cursorword",
    version = false,
    config = function()
      require("mini.cursorword").setup {}
    end,
    event = "BufRead",
  },
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup {}
    end,
    event = "BufRead",
  },
  {
    -- Setup for lsp and formatting
    "neovim/nvim-lspconfig",

    -- dependencies = {
    --   "nvimtools/none-ls.nvim",
    --   config = function()
    --     require "custom.configs.null-ls"
    --   end,
    -- },

    -- The setup of the different lsps
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- Enables jj and jk commands to exit insert mode
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,

    event = "InsertEnter",
  },
  {
    -- Debug Framework
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "custom.configs.nvim-dap"
    end,
  },
  {
    -- To be able to mark often used files and easily get back to them
    "ThePrimeagen/harpoon",
  },
  {
    -- Setup of the unit testing for dotnet
    "Issafalcon/neotest-dotnet",
    config = function()
      require "custom.configs.neotest-dotnet"
    end,
  },
  {
    -- Framework for unit testing
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
    },
  },
  {
    -- Docs and completion for the neovim API
    "folke/neodev.nvim",
    config = function()
      require "custom.configs.neodev"
    end,
  },
  {
    -- UI for debugging
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "custom.configs.nvim-dap-ui"
    end,
  },
  {
    -- Show errors in the solution
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup {}
    end,
  },
}

return plugins
