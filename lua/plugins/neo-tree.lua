return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function ()
		vim.api.nvim_set_hl(0, "NormalFloat", {bg="none", fg="none"})
		vim.api.nvim_set_hl(0, "FloatBorder", {bg="none", fg="none"})
	end
}
