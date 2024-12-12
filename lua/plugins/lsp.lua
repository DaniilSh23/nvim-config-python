return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.jedi_language_server.setup({})
			-- lspconfig.pyright.setup({})
			-- lspconfig.gopls.setup({})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "перейти к определению" }
					)
					vim.keymap.set(
						"n",
						"<c-LeftMouse>",
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "перейти к определению" }
					)
					vim.keymap.set(
						"n",
						"<leader>h",
						vim.lsp.buf.hover,
						{ buffer = ev.buf, desc = "показать сигнатуру" }
					)
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ buffer = ev.buf, desc = "перейти к имплементации" }
					)
					vim.keymap.set(
						"n",
						"<C-k>",
						vim.lsp.buf.signature_help,
						{ buffer = ev.buf, desc = "помощь по сигнатуре" }
					)
					vim.keymap.set("n", "<Leader>sa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<Leader>sr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<Leader>sl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set(
						"n",
						"<Leader>r",
						vim.lsp.buf.rename,
						{ buffer = ev.buf, desc = "переименовать" }
					)
					vim.keymap.set(
						{ "n", "v" },
						"<Leader>la",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "действия по коду" }
					)
					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<A-S-l>", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = ev.buf, desc = "отформатировать файл" })
				end,
			})
		end,
	},
}
