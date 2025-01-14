local dap = require("dap")

local data_path = vim.fn.stdpath("data")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 8123,
	executable = {
		command = "js-node-adapter",
	},
}

for _, lang in ipairs({ "javascript", "typescript" }) do
	dap.configurations[lang] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
end

local dap_path = data_path .. "/mason/packages/netcoredbg/libexec/netcoredbg/netcoredbg"

dap.adapters.coreclr = {
	type = "executable",
	command = dap_path,
	args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = {
	type = "executable",
	command = dap_path,
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
		end,
	},
}
