return {
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				line_mapping = "<leader>c",
				operator_mapping = "<leader>c",
				comment_chunk_text_object = "ic",
			})
		end,
	},
}
