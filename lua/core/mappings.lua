-- Hot keys mapping

-- Leader (general action key)
vim.g.mapleader = " "

-- Buffers
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<c-s>", ":w!<cr>")
vim.keymap.set("x", "<C-S-X>", '"+d')
vim.keymap.set("v", "<C-S-c>", '"+y') -- Copy
vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<C-S-v>", "<C-R><C-O>+") -- Paste insert mode

-- Move code blocks
vim.api.nvim_set_keymap("v", "<c-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-Down>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<c-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-Up>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<c-h>", ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<c-Left>", ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<c-l>", ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<c-Right>", ":MoveHBlock(1)<CR>", { noremap = true, silent = true })

-- Remove highlights
vim.keymap.set("n", "<esc>", ":noh<cr>")

-- Neo Tree
vim.keymap.set("n", "<leader>e", ":Neotree left toggle reveal<CR>")

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-Up>", ":wincmd k<CR>")

vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-Down>", ":wincmd j<CR>")

vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-Left>", ":wincmd h<CR>")

vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<c-Right>", ":wincmd l<CR>")
vim.keymap.set("n", "<c-/>", ":CommentToggle<CR>")
vim.keymap.set("v", "<c-/>", ":CommentToggle<CR>")

-- Split buffers
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<c-x>", ":BufferLineCloseOthers<CR>")

-- Close tabs
vim.keymap.set("n", "<C-q>", function()
	-- close current win if there are more than 1 win
	-- else close current tab if there are more than 1 tab
	-- else close current vim
	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
		vim.cmd([[close]])
	elseif #vim.api.nvim_list_tabpages() > 1 then
		vim.cmd([[tabclose]])
	else
		vim.cmd([[wqa!]])
	end
end, { desc = "Закрытие всех окон и самого nvim" })

-- DAP
vim.keymap.set(
	"n",
	"<leader>1",
	":lua require'dap'clear_breakpoints()<CR>",
	{ desc = "DEBUG: очистка точек" }
)
vim.keymap.set(
	"n",
	"<leader>1",
	":lua require'dapui'.float_element('scopes', {position = 'center',  enter = true })<CR>",
	{ desc = "DEBUG: очистка точек" }
)
vim.keymap.set(
	"n",
	"<leader>2",
	":lua require'dapui'.float_element('console', {position = 'center'})<CR>",
	{ desc = "DEBUG: консоль по центру" }
)
vim.keymap.set(
	"n",
	"<leader>3",
	":lua require'dapui'.toggle()<CR>",
	{ desc = "DEBUG: открывает окна дебага" }
)
vim.keymap.set(
	"n",
	"<leader>4",
	":lua require'dap'.toggle_breakpoint()<CR>",
	{ desc = "DEBUG: поставить/убрать точку" }
)
vim.keymap.set(
	"n",
	"<leader>5",
	":lua require'dap'.continue()<CR>",
	{ desc = "DEBUG: continue() вроде как стартует дебаг" }
)
vim.keymap.set(
	"n",
	"<leader>6",
	":lua require'dap'.restart()<CR>",
	{ desc = "DEBUG: restart() - перезапуск, что не ясно" }
)
vim.keymap.set(
	"n",
	"<leader>7",
	":lua require'dap'.step_over()<CR>",
	{ desc = "DEBUG: step_over() - пройди мимо.." }
)
vim.keymap.set(
	"n",
	"<leader>8",
	":lua require'dap'.step_into()<CR>",
	{ desc = "DEBUG: step_into() - войди в нее.." }
)
vim.keymap.set(
	"n",
	"<leader>9",
	":lua require'dap'.step_out()<CR>",
	{ desc = "DEBUG: step_out() - вынимай и уходи!" }
)
