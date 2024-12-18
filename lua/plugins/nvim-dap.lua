return {
	{
		-- Базовый плагин для дебага
		"mfussenegger/nvim-dap",
		-- Плагин для дебага python кода
		"mfussenegger/nvim-dap-python",
		-- Какая-то хуйня про виртуальный текст для поиска определения переменных
		"theHamsta/nvim-dap-virtual-text",

		-- Конфигурируем эту хуйню
		config = function()
			local dap = require("dap")
			require("dap-python").setup()

			-- Функция для определения пути к интерпретатора python
			local pythonPath = function()
				local cwd = vim.loop.cwd()
				if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return "/usr/bin/python"
				end
			end

			-- Конифгурация дебагера для python
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
					pythonPath = pythonPath(),
				},
			}

			dap.adapters.python = {
				type = "executable",
				command = pythonPath(),
				args = { "-m", "debugpy.adapter" },
			}
		end,
	},
	-- Плагин для UI визуализации дебаг режима
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup({
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.70,
							},
							{
								id = "breakpoints",
								size = 0.10,
							},
							{
								id = "stacks",
								size = 0.20,
							},
						},
						position = "left",
						size = 30,
					},
					{
						elements = {
							{
								id = "repl",
								size = 1,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
			})

			-- Визуализируем точки останова
			vim.fn.sign_define("DapBreakpoint", {
				text = "⬤",
				texthl = "ErrorMsg",
				linehl = "",
				numhl = "ErrorMsg",
			})

			vim.fn.sign_define("DapBreakpointCondition", {
				text = "⬤",
				texthl = "ErrorMsg",
				linehl = "",
				numhl = "SpellBad",
			})
		end,
	},
}
