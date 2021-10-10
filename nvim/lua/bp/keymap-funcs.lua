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

function M.make_session(close)
	local project_names = {}
	local initial_win = vim.api.nvim_get_current_win()
	local wins = vim.api.nvim_list_wins()
	for _, w in ipairs(wins) do
		if vim.api.nvim_win_get_config(w).relative == "" then -- non floating window
			vim.api.nvim_set_current_win(w)
			if vim.api.nvim_buf_get_option(0, "buftype") == "" and vim.api.nvim_buf_get_option(0, "filetype") ~= "help" then
				local wd = vim.fn.getcwd()
				local tail_wd = vim.fn.fnamemodify(wd, ":p:h:t")
				project_names[tail_wd] = true
			end
		else -- floating window
			vim.api.nvim_win_close(w, true)
		end
	end
	vim.api.nvim_set_current_win(initial_win)

	local session_path = vim.fn.stdpath("data") .. "/session/"
	local session_name = {}
	for name in pairs(project_names) do
		table.insert(session_name, name)
	end
	table.sort(session_name)
	session_name = table.concat(session_name, "__")
	session_name = "session__" .. session_name .. ".vim"

	vim.cmd("mksession! " .. session_path .. session_name)
	if close then
		vim.cmd("qall")
	end
end

M.switch_prev_buf = function()
	if vim.fn.buflisted(0) == 1 then
		vim.cmd("buffer #")
	else
		vim.cmd("bprevious")
	end
end

M.buf_close = function()
	local buf_target = vim.api.nvim_get_current_buf()
	local win_targets = vim.fn.win_findbuf(buf_target)
	for _, w in ipairs(win_targets) do
		vim.api.nvim_win_call(w, M.switch_prev_buf)
	end

	local is_term_buf = vim.api.nvim_buf_get_option(buf_target, "buftype") == "terminal"
	vim.schedule(function()
		vim.api.nvim_buf_delete(buf_target, { force = is_term_buf })
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
				vim.api.nvim_buf_delete(b, {})
			end)
		end
	end
end

M.start_hl = function()
	if not vim.v.event.abort then
		vim.cmd([[
		augroup SearchHL
		autocmd!
		autocmd CursorMoved * lua require'bp.keymap-funcs'.search_hl()
		autocmd InsertEnter,TermEnter * lua require'bp.keymap-funcs'.stop_hl()
		augroup END
		]])
	end
end

M.search_hl = function()
	if vim.v.hlsearch == 1 then
		local cur_line = vim.api.nvim_get_current_line()
		local col = vim.fn.col(".")
		local pos = vim.fn.match(cur_line, vim.fn.getreg("/"), col - 1) + 1
		if pos ~= col then
			M.stop_hl()
		end
	else
		vim.cmd("autocmd! SearchHL")
	end
end

M.stop_hl = function()
	vim.cmd("autocmd! SearchHL")
	if vim.v.hlsearch == 1 then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<plug>NoHL", true, false, true), "m", true)
		vim.cmd("echo ''")
	end
end

return M
