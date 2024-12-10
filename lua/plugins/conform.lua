return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			-- Базовая настройка плагина
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
					javascript = { "prettier", stop_after_first = true },
				},
			})

			-- При сохранении буфера (файла) будет вызываться форматтер
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
