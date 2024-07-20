vim.keymap.set("", "<home>", "^", { desc = "Go to first non-blank character of line" })
vim.keymap.set("i", "<home>", "<c-o>^", { desc = "Go to first non-blank character of line" })

vim.keymap.set("i", ",", ",<c-g>u", { desc = "Close undo sequence" })
vim.keymap.set("i", ".", ".<c-g>u", { desc = "Close undo sequence" })
vim.keymap.set("i", "!", "!<c-g>u", { desc = "Close undo sequence" })
vim.keymap.set("i", "?", "?<c-g>u", { desc = "Close undo sequence" })

vim.keymap.set("n", "gf", "gF", { desc = "Go to file and line" })
vim.keymap.set("n", "gh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

vim.keymap.set("n", "<c-o>", "<c-o>zz", { desc = "Go to older postion in jump list and centre screen" })
vim.keymap.set("n", "<c-i>", "<c-i>zz", { desc = "Go to newer postion in jump list and centre screen" })

vim.keymap.set("x", "p", '"_dP', { desc = "Paste without saving replaced text to register" })
vim.keymap.set("x", "<leader>p", '"_d"+P', { desc = "Paste from clipboard without saving replaced text to register" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Yank to clipboard" })

vim.keymap.set("x", "J", ":move '>+1<cr>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("x", "K", ":move '<-2<cr>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("x", "<", "<gv", { desc = "Shift and reselect" })
vim.keymap.set("x", ">", ">gv", { desc = "Shift and reselect" })

vim.keymap.set("n", "<leader>sa", "<cmd>write<cr>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>so", "<cmd>source<cr>", { desc = "Source buffer" })
vim.keymap.set("x", "<leader>so", ":'<,'>source<cr>", { desc = "Source selection" })

vim.keymap.set("n", "<c-c>", "<c-w>c", { desc = "Close window" })
vim.keymap.set("n", "<c-w><c-t>", "<cmd>tab split<cr>", { desc = "Create tab" })
vim.keymap.set("n", "<c-w><c-;>", "<cmd>tabprevious<cr>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<c-w><c-'>", "<cmd>tabnext<cr>", { desc = "Go to next tab" })
vim.keymap.set("n", "<c-w><c-:>", "<cmd>tabmove -1<cr>", { desc = "Move tab left" })
vim.keymap.set("n", '<c-w><c-">', "<cmd>tabmove +1<cr>", { desc = "Move tab right" })
vim.keymap.set("n", "<c-left>", "<c-w>10<", { desc = "Reduce window width" })
vim.keymap.set("n", "<c-right>", "<c-w>10>", { desc = "Increase window width" })
vim.keymap.set("n", "<c-down>", "<c-w>6-", { desc = "Reduce window height" })
vim.keymap.set("n", "<c-up>", "<c-w>6+", { desc = "Increase window height" })
vim.keymap.set("n", "<c-w><c-f>", function()
	vim.api.nvim_open_win(0, true, {
		relative = "editor",
		width = vim.o.columns - 12,
		height = vim.o.lines - 6,
		row = 1,
		col = 6,
		border = "rounded",
	})
end, { desc = "Creat float window" })
vim.api.nvim_create_user_command("Scratch", function()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_set_current_buf(buf)
end, { desc = "Create a new scratch buffer and switch to it" })

vim.keymap.set("n", "<leader>cv", "<cmd>qall<cr>", { desc = "Quit all windows" })
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
end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>ct", "<cmd>tabclose<cr>", { desc = "Close tab" })

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Switch to previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Switch to next buffer" })
vim.keymap.set("n", "[B", "<cmd>bfirst<cr>", { desc = "Switch to first buffer" })
vim.keymap.set("n", "]B", "<cmd>blast<cr>", { desc = "Switch to last buffer" })
vim.keymap.set("n", "<c-space>", function()
	if vim.fn.buflisted(0) == 1 then
		vim.cmd("buffer #")
	else
		vim.cmd("bprevious")
	end
end, { desc = "Switch to previous buffer" })

vim.keymap.set("n", "<leader>q", function()
	local winid = vim.fn.getqflist({ winid = 0 }).winid
	if winid ~= 0 then
		vim.cmd("cclose")
	elseif not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end, { desc = "Toggle quickfix list window" })
