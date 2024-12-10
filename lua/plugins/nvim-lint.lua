return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			-- Описываем какие файлы и чем линтить
			require("lint").linters_by_ft = {
				python = { "ruff" },
			}

			-- Вызов линтера при сохранении файла
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
