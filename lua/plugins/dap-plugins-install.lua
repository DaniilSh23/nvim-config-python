return {
	-- DAP plugins
	{
		"mfussenegger/nvim-dap",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("config.nvim-dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("config.dap-ui-config")
		end,
	},
}
