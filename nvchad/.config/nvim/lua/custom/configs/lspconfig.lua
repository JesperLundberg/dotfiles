local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.csharp_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"/home/jesper/.dotnet/tools/csharp-ls"},
  filetypes = {"cs"},
  init_options = {AutomaticWorkspaceInit = true},
  root_dir = lspconfig.util.root_pattern("*.sln", ".git")
})
