vim.keymap.set("", "<home>", "^")
vim.keymap.set("i", "<home>", "<c-o>^")
vim.keymap.set("n", "~", "g~")

vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

vim.keymap.set("n", "gf", "gF")

vim.keymap.set("i", "<cr>", [[pumvisible() ? "<c-y>" : "<cr>"]], { expr = true })

vim.keymap.set("n", "<c-o>", "<c-o>zz")
vim.keymap.set("n", "<c-i>", "<c-i>zz")

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

vim.keymap.set("n", "<leader>sa", "<cmd>write ++p<cr>")
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

vim.keymap.set("n", "<leader>cv", "<cmd>qall<cr>")
vim.keymap.set("n", "<leader>cb", function()
	local target_buf = vim.api.nvim_get_current_buf()
	local target_wins = vim.fn.win_findbuf(target_buf)
	for _, w in ipairs(target_wins) do
		vim.api.nvim_win_call(w, function()
			if vim.fn.buflisted(0) == 1 then
				vim.cmd("buffer #")
			else
				vim.cmd("bprevious")
			end
		end)
	end

	vim.cmd("bdelete " .. target_buf)
end)
vim.keymap.set("n", "<leader>ct", "<cmd>tabclose<cr>")

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")
vim.keymap.set("n", "[B", "<cmd>bfirst<cr>")
vim.keymap.set("n", "]B", "<cmd>blast<cr>")
vim.keymap.set("n", "''", function()
	if vim.fn.buflisted(0) == 1 then
		vim.cmd("buffer #")
	else
		vim.cmd("bprevious")
	end
end, { desc = "Switch to previous buffer" })

vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
vim.keymap.set("n", "[Q", "<cmd>cfirst<cr>")
vim.keymap.set("n", "]Q", "<cmd>clast<cr>")
vim.keymap.set("n", "<c-w><c-space>", function()
	local winid = vim.fn.getqflist({ winid = 0 }).winid
	if winid ~= 0 then
		vim.cmd("cclose")
	elseif not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end, { desc = "Toggle quickfix list window" })

vim.keymap.set("n", "[l", "<cmd>lprev<cr>")
vim.keymap.set("n", "]l", "<cmd>lnext<cr>")
vim.keymap.set("n", "[L", "<cmd>lfirst<cr>")
vim.keymap.set("n", "]L", "<cmd>llast<cr>")
vim.keymap.set("n", "<c-w><space>", function()
	local winid = vim.fn.getloclist(0, { winid = 0 }).winid
	if winid ~= 0 then
		vim.cmd("lclose")
	elseif not vim.tbl_isempty(vim.fn.getloclist(0)) then
		vim.cmd("lopen")
	end
end, { desc = "Toggle location list window" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
