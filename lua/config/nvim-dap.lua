local dap = require("dap")
local dap_python = require("dap-python")

local pythonPath = function()
	local cwd = vim.loop.cwd()
	if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		return cwd .. "/.venv/bin/python"
	else
		return "/usr/bin/python3"
	end
end

-- Конфигурация для Python
local set_python_dap = function()
	dap_python.setup(pythonPath())

	dap.adapters.python = {
		type = "executable",
		command = pythonPath(),
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = pythonPath(),
		},
		{
			type = "python",
			request = "launch",
			name = "DAP Django",
			program = vim.loop.cwd() .. "/manage.py",
			args = { "runserver", "--noreload" },
			justMyCode = true,
			django = true,
			console = "integratedTerminal",
		},
		{
			type = "python",
			request = "attach",
			name = "Attach remote",
			connect = function()
				return {
					host = "127.0.0.1",
					port = 5678,
				}
			end,
		},
		{
			type = "python",
			request = "launch",
			name = "Launch file with arguments",
			program = "${file}",
			args = function()
				local args_string = vim.fn.input("Arguments: ")
				return vim.split(args_string, " +")
			end,
			console = "integratedTerminal",
			pythonPath = pythonPath,
		},
	}
end

-- Вызываем функцию конфигурации DAP python
set_python_dap()
vim.api.nvim_create_autocmd({ "DirChanged", "BufEnter" }, {
	callback = function()
		set_python_dap()
	end,
})
