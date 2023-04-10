local dap = require("dap")

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/jesper/.local/share/nvim/mason/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function ()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/src/', 'file')
    end,
  },
}
