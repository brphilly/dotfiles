local helpers = "<cmd>lua require'bp.keymap-funcs'."
local mappings = {
	{ "n", "<c-left>", "<c-w>10<", { noremap = true } },
	{ "n", "<c-right>", "<c-w>10>", { noremap = true } },
	{ "n", "<c-down>", "<c-w>6-", { noremap = true } },
	{ "n", "<c-up>", "<c-w>6+", { noremap = true } },
	{ "n", "<c-h>", "<c-w>h", { noremap = true } },
	{ "n", "<c-l>", "<c-w>l", { noremap = true } },
	{ "n", "<c-j>", "<c-w>j", { noremap = true } },
	{ "n", "<c-k>", "<c-w>k", { noremap = true } },
	{ "x", "<c-h>", [[<c-\><c-n><c-w>h]], { noremap = true } },
	{ "x", "<c-l>", [[<c-\><c-n><c-w>l]], { noremap = true } },
	{ "x", "<c-j>", [[<c-\><c-n><c-w>j]], { noremap = true } },
	{ "x", "<c-k>", [[<c-\><c-n><c-w>k]], { noremap = true } },
	{ "t", "<c-[>", [[<c-\><c-n>]], { noremap = true } },
	{ "i", "<c-j>", "<c-o>o", { noremap = true } },
	{ "i", "<c-k>", "<c-o>O", { noremap = true } },

	{ "", "<home>", "^", { noremap = true } },
	{ "i", "<home>", "<c-o>^", { noremap = true } },
	{ "n", "~", "g~", { noremap = true } },

	{ "i", ",", ",<c-g>u", { noremap = true } },
	{ "i", ".", ".<c-g>u", { noremap = true } },
	{ "i", "!", "!<c-g>u", { noremap = true } },
	{ "i", "?", "?<c-g>u", { noremap = true } },

	{ "i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { noremap = true, expr = true } },
	{ "i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<tab>"]], { noremap = true, expr = true } },
	{ "i", "<cr>", [[pumvisible() ? "<c-y>" : "<cr>"]], { noremap = true, expr = true } },

	{ "n", "<leader>me", "<c-w>=", { noremap = true } },
	{ "n", "<leader>mw", "<c-w>|", { noremap = true } },
	{ "n", "<leader>mh", "<c-w>_", { noremap = true } },

	{ "n", "zh", "zH", { noremap = true } },
	{ "n", "zH", "zh", { noremap = true } },
	{ "n", "zL", "zl", { noremap = true } },
	{ "n", "zl", helpers .. "hor_scroll()<cr>", { noremap = true } },

	{ "x", "p", '"_dP', { noremap = true } },
	{ "x", "<leader>p", '"_d"+P', { noremap = true } },
	{ "n", "<leader>p", '"+p', { noremap = true } },
	{ "n", "<leader>P", '"+P', { noremap = true } },
	{ "n", "<leader>y", '"+y', { noremap = true } },
	{ "x", "<leader>y", '"+y', { noremap = true } },

	{ "x", "J", ":move '>+1<cr>gv=gv", { noremap = true } },
	{ "x", "K", ":move '<-2<cr>gv=gv", { noremap = true } },
	{ "x", "<", "<gv", { noremap = true } },
	{ "x", ">", ">gv", { noremap = true } },

	{ "n", "<leader>sa", "<cmd>update<cr>", { noremap = true } },
	{ "n", "<leader>ss", helpers .. "make_session(false)<cr>", { noremap = true } },
	{ "n", "<leader>so", "<cmd>source<cr>", { noremap = true } },
	{ "x", "<leader>so", ":'<,'>source<cr>", { noremap = true } },

	{ "n", [[<leader>\]], "<cmd>vsplit<cr>", { noremap = true } },
	{ "n", "<leader>-", "<cmd>split<cr>", { noremap = true } },
	{ "n", "<leader>=", "<cmd>tab split<cr>", { noremap = true } },
	{ "n", "[t", "<cmd>tabprevious<cr>", { noremap = true } },
	{ "n", "]t", "<cmd>tabnext<cr>", { noremap = true } },
	{ "n", "[T", "<cmd>tabmove -1<cr>", { noremap = true } },
	{ "n", "]T", "<cmd>tabmove +1<cr>", { noremap = true } },

	{ "n", "<leader>cv", helpers .. "make_session(true)<cr>", { noremap = true } },
	{ "n", "<leader>cb", helpers .. "buf_close()<cr>", { noremap = true } },
	{ "n", "<leader>ch", helpers .. "buf_close_hid()<cr>", { noremap = true } },
	{ "n", "<leader>cu", helpers .. "buf_close_unlist()<cr>", { noremap = true } },
	{ "n", "<leader>cw", "<cmd>q<cr>", { noremap = true } },
	{ "n", "<leader>ct", "<cmd>tabclose<cr>", { noremap = true } },

	{ "n", "[b", "<cmd>bprevious<cr>", { noremap = true } },
	{ "n", "]b", "<cmd>bnext<cr>", { noremap = true } },
	{ "n", "[B", "<cmd>bfirst<cr>", { noremap = true } },
	{ "n", "]B", "<cmd>blast<cr>", { noremap = true } },
	{ "n", "''", helpers .. "switch_prev_buf()<cr>", { noremap = true } },

	{ "n", "[q", "<cmd>cprev<cr>", { noremap = true } },
	{ "n", "]q", "<cmd>cnext<cr>", { noremap = true } },
	{ "n", "[Q", "<cmd>cfirst<cr>", { noremap = true } },
	{ "n", "]Q", "<cmd>clast<cr>", { noremap = true } },
	{ "n", [[\]], helpers .. "toggle_qf()<cr>", { noremap = true } },
	{ "n", "<leader>gc", [[<cmd>execute 'silent grep! "^=======$"' | copen<cr>]], { noremap = true } },

	{ "n", "[l", "<cmd>lprev<cr>", { noremap = true } },
	{ "n", "]l", "<cmd>lnext<cr>", { noremap = true } },
	{ "n", "[L", "<cmd>lfirst<cr>", { noremap = true } },
	{ "n", "]L", "<cmd>llast<cr>", { noremap = true } },
	{ "n", "|", helpers .. "toggle_ll()<cr>", { noremap = true } },

	{ "n", "<leader>dk", '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { noremap = true } },
	{ "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true } },
	{ "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true } },
	{ "n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true } },
	{ "n", "<leader>dq", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true } },

	{ "n", "<leader>rr", "<cmd>redraw!<cr>", { noremap = true } },
	{ "n", "<leader>re", "<cmd>echo<cr>", { noremap = true } },
	{ "n", "<leader>rs", "<cmd>redrawstatus!<cr>", { noremap = true } },
	{ "n", "<leader>rt", "<cmd>redrawtabline<cr>", { noremap = true } },
	{ "n", "<leader>ro", "<cmd>source " .. vim.fn.stdpath("config") .. "/plugin/options.lua<cr>", { noremap = true } },

	{ "n", "*", "*" .. helpers .. "start_hl()<cr>", { noremap = true } },
	{ "n", "#", "#" .. helpers .. "start_hl()<cr>", { noremap = true } },
	{ "n", "n", "n" .. helpers .. "start_hl()<cr>", { noremap = true } },
	{ "n", "N", "N" .. helpers .. "start_hl()<cr>", { noremap = true } },
	{ "", "<plug>NoHL", "<cmd>nohlsearch<cr>", { noremap = true } },
	{ "!", "<plug>NoHL", "<cmd>nohlsearch<cr>", { noremap = true } },
	{ "t", "<plug>NoHL", "<cmd>nohlsearch<cr>", { noremap = true } },
}
for _, map in ipairs(mappings) do
	vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
end
