local plugins = {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function ()
        require "custom.configs.null-ls"
      end,
    },

    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    lazy = false
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "Issafalcon/neotest-dotnet",
    config = function ()
      require "custom.configs.neotest-dotnet"
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
    },
  },
  {
    "folke/neodev.nvim",
    config = function ()
      require "custom.configs.neodev"
    end,
  },
  {
    "nvim-lua/plenary.nvim"
  },

}

return plugins
