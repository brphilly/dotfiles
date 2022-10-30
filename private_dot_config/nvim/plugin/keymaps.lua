vim.keymap.set("", "<home>", "^")
vim.keymap.set("i", "<home>", "<c-o>^")
vim.keymap.set("n", "~", "g~")

vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

vim.keymap.set("i", "<cr>", [[pumvisible() ? "<c-y>" : "<cr>"]], { expr = true })

vim.keymap.set("n", "zh", "zH")
vim.keymap.set("n", "zH", "zh")
vim.keymap.set("n", "zL", "zl")
vim.keymap.set("n", "zl", require("bp.keymap-funcs").hor_scroll)

vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("x", "<leader>p", '"_d"+P')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("x", "<leader>y", '"+y')

vim.keymap.set("x", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("x", "K", ":move '<-2<cr>gv=gv")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

vim.keymap.set("n", "<leader>sa", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>ss", function() require("bp.keymap-funcs").make_session(false) end)
vim.keymap.set("n", "<leader>so", "<cmd>source<cr>")
vim.keymap.set("x", "<leader>so", ":'<,'>source<cr>")

vim.keymap.set("n", "<c-c>", "<c-w>c")
vim.keymap.set("n", "<c-w><c-t>", "<cmd>tab split<cr>")
vim.keymap.set("n", "<c-w><c-bs>", "<cmd>tab split<cr>")
vim.keymap.set("n", "<c-w><c-m>", "<c-w>o")
vim.keymap.set("n", "<c-w><c-;>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "<c-w><c-'>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<c-w><c-:>", "<cmd>tabmove -1<cr>")
vim.keymap.set("n", '<c-w><c-">', "<cmd>tabmove +1<cr>")
vim.keymap.set("n", "<c-left>", "<c-w>10<")
vim.keymap.set("n", "<c-right>", "<c-w>10>")
vim.keymap.set("n", "<c-down>", "<c-w>6-")
vim.keymap.set("n", "<c-up>", "<c-w>6+")
vim.keymap.set("n", "<c-w><c-f>", function()
	vim.api.nvim_open_win(0, true, {
		relative = "editor",
		width = vim.o.columns - 12,
		height = vim.o.lines - 6,
		row = 1,
		col = 6,
		border = "rounded",
	})
end)
vim.keymap.set("n", "'g", "<cmd>terminal lazygit<cr>i")

vim.keymap.set("n", "<leader>cv", function() require("bp.keymap-funcs").make_session(true) end)
vim.keymap.set("n", "<leader>cb", require("bp.keymap-funcs").buf_close)
vim.keymap.set("n", "<leader>ch", require("bp.keymap-funcs").buf_close_hid)
vim.keymap.set("n", "<leader>cu", require("bp.keymap-funcs").buf_close_unlist)
vim.keymap.set("n", "<leader>ct", "<cmd>tabclose<cr>")

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")
vim.keymap.set("n", "[B", "<cmd>bfirst<cr>")
vim.keymap.set("n", "]B", "<cmd>blast<cr>")
vim.keymap.set("n", "''", require("bp.keymap-funcs").switch_prev_buf)

vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
vim.keymap.set("n", "[Q", "<cmd>cfirst<cr>")
vim.keymap.set("n", "]Q", "<cmd>clast<cr>")
vim.keymap.set("n", "<c-w><c-space>", require("bp.keymap-funcs").toggle_qf)

vim.keymap.set("n", "[l", "<cmd>lprev<cr>")
vim.keymap.set("n", "]l", "<cmd>lnext<cr>")
vim.keymap.set("n", "[L", "<cmd>lfirst<cr>")
vim.keymap.set("n", "]L", "<cmd>llast<cr>")
vim.keymap.set("n", "<c-w><space>", require("bp.keymap-funcs").toggle_ll)

vim.api.nvim_create_user_command("DiagnosticLine", function(_) vim.diagnostic.open_float(0, {scope = "line"}) end, {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.api.nvim_create_user_command("DiagnosticBuf", function(_) vim.diagnostic.setloclist() end, {})
vim.api.nvim_create_user_command("DiagnosticAll", function(_) vim.diagnostic.setqflist() end, {})

vim.keymap.set("n", "*", "*<cmd>lua require('bp.keymap-funcs').start_hl()<cr>")
vim.keymap.set("n", "#", "#<cmd>lua require('bp.keymap-funcs').start_hl()<cr>")
vim.keymap.set("n", "n", "n<cmd>lua require('bp.keymap-funcs').start_hl()<cr>")
vim.keymap.set("n", "N", "N<cmd>lua require('bp.keymap-funcs').start_hl()<cr>")
vim.keymap.set("", "<plug>NoHL", "<cmd>nohlsearch<cr>")
vim.keymap.set("!", "<plug>NoHL", "<cmd>nohlsearch<cr>")
vim.keymap.set("t", "<plug>NoHL", "<cmd>nohlsearch<cr>")
