return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = {
					"python",
					"go",
					"javascript",
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					--"markdown",
					--"markdown_inline",
					"html",
				},
				auto_install = true,
				highlight = {
					enable = true,
				}
			}
		end
	}
}
