return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({})

		-- Key binding
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope будет искать файлы" })
		vim.keymap.set(
			"n",
			"<leader>fw",
			builtin.live_grep,
			{ desc = "Telescope будет искать текст в файлах" }
		)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fb", ":Telescope git_branches<CR>", { desc = "Telescope ветки GIT" })
		vim.keymap.set("n", "<leader>fgs", ":Telescope git_status<CR>", { desc = "Telescope GIT status" })
		vim.keymap.set("n", "<leader>fgc", ":Telescope git_commits<CR>", { desc = "Telescope GIT коммиты" })
	end,
}
