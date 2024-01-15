local M = {}

function M.hor_scroll()
	local cur_line = vim.api.nvim_get_current_line()
	local cur = vim.api.nvim_win_get_cursor(0)
	if cur[2] >= #cur_line - 1 then
		local topline = vim.fn.line("w0")
		local botline = vim.fn.line("w$")
		local lines = vim.api.nvim_buf_get_lines(0, topline - 1, botline, false)
		local cur_ind = cur[1] - topline + 1

		local dist = math.huge
		local final_ind = cur_ind
		for ind, line in ipairs(lines) do
			if #line > #cur_line + 10 and math.abs(ind - cur_ind) <= dist then
				dist = math.abs(ind - cur_ind)
				final_ind = ind
			end
		end
		vim.cmd("mark '")
		local final_row = final_ind + topline - 1
		vim.api.nvim_win_set_cursor(0, { final_row, cur[2] })
	end
	vim.api.nvim_feedkeys("zL", "n", false)
end

M.switch_prev_buf = function()
	if vim.fn.buflisted(0) == 1 then
		vim.cmd("buffer #")
	else
		vim.cmd("bprevious")
	end
end

function M.toggle_qf()
	local winid = vim.fn.getqflist({ winid = 0 }).winid

	if winid ~= 0 then
		vim.cmd("cclose")
	elseif not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end

function M.toggle_ll()
	local winid = vim.fn.getloclist(0, { winid = 0 }).winid

	if winid ~= 0 then
		vim.cmd("lclose")
	elseif not vim.tbl_isempty(vim.fn.getloclist(0)) then
		vim.cmd("lopen")
	end
end

M.buf_close = function()
	local buf_target = vim.api.nvim_get_current_buf()
	local win_targets = vim.fn.win_findbuf(buf_target)
	for _, w in ipairs(win_targets) do
		vim.api.nvim_win_call(w, M.switch_prev_buf)
	end

	local is_term_buf = (vim.api.nvim_get_option_value("buftype", { buf = buf_target }) == "terminal") and "!" or ""
	vim.schedule(function()
		vim.cmd(table.concat({ buf_target, "bdelete", is_term_buf }))
	end)
end

function M.buf_close_unlist()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(b) == 0 and #vim.fn.win_findbuf(b) == 0 then
			vim.schedule(function()
				vim.api.nvim_buf_delete(b, {})
			end)
		end
	end
end

M.buf_close_hid = function()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(b) == 1 and #vim.fn.win_findbuf(b) == 0 then
			vim.schedule(function()
				vim.cmd("bdelete " .. b)
			end)
		end
	end
end

return M
