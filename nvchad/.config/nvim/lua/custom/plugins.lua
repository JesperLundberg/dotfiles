local mason = require("custom.configs.mason")
local treesitter = require("custom.configs.treesitter")

local plugins = {
  {
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
    -- Focus on one file
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({})
    end,
    event = "VeryLazy",
  },
  {
    -- Dim everything but the current function where cursor resides
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({})
    end,
    event = "VeryLazy",
  },
  {
    "wuelnerdotexe/vim-astro",
    event = "BufRead",
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function() end,
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup({})
    end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = function()
      require("custom.configs.nvim-early-retirement")
    end,
    event = "VeryLazy",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("custom.configs.copilot")
    end,
  },
  {
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup({
        options = {
          reindent_linewise = true,
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
  },
  {
    -- Setup for lsp and formatting
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("custom.configs.null-ls")
      end,
    },
    -- The setup of the different lsps
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    -- Enables jj and jk commands to exit insert mode
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    lazy = false,
  },
  {
    -- Debug Framework
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("custom.configs.nvim-dap")
    end,
  },
  {
    -- Used with neotest
    "nvim-lua/plenary.nvim",
  },
  {
    -- To be able to mark often used files and easily get back to them
    "ThePrimeagen/harpoon",
  },
  {
    -- Setup of the unit testing for dotnet
    "Issafalcon/neotest-dotnet",
    config = function()
      require("custom.configs.neotest-dotnet")
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
    -- Api completion - does not work with symlinks?!
    "folke/neodev.nvim",
    config = function()
      require("custom.configs.neodev")
    end,
  },
  {
    -- UI for debugging
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("custom.configs.nvim-dap-ui")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("custom.configs.trouble")
    end,
  },
}

return plugins
