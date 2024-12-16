-- Плагин для UI визуализации дебаг режима
local status, dapui = pcall(require, "dapui")
if not status then
	return -- Если модуль не найден, не выполняем код дальше
end

dapui.setup({
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

-- Настройка автозапуска UI при старте DAP
local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

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
