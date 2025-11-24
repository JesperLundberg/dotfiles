return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          treesitter = true,
          telescope = { enabled = true },
          blink_cmp = true,
          gitsigns = true,
          which_key = true,
        },
        transparent_background = false,
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
