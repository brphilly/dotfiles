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
	-- close all floating windows as they cause problems when saved in sessions
	-- also close windows containing buffers with weird types
	for _, w in ipairs(vim.api.nvim_list_wins()) do
		local bt = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), "buftype")
		if vim.api.nvim_win_get_config(w).relative ~= "" or (bt ~= "" and bt ~= "help" and bt ~= "terminal") then
			vim.api.nvim_win_close(w, true)
		end
	end

	-- loop through buffers and get cwd of those I want to save
	local work_dirs = {} -- set of cwd tails
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(b, "buflisted") and vim.api.nvim_buf_get_option(b, "buftype") == "" then
			vim.api.nvim_buf_call(b, function()
				vim.cmd("doautocmd <nomodeline> BufEnter") -- make sure rooter plugin updates the cwd
				local cwd = vim.fn.getcwd()
				local tail = vim.fn.fnamemodify(cwd, ":p:h:t")
				work_dirs[tail] = true
			end)
		end
	end
	vim.cmd("doautocmd <nomodeline> BufEnter") -- make sure rooter plugin updates the cwd

	-- concatenate set of work_dirs into one string to use as session name
	local session_name = {}
	for name in pairs(work_dirs) do
		table.insert(session_name, name)
	end
	table.sort(session_name)
	session_name = table.concat(session_name, "__")
	session_name = "session__" .. session_name .. ".vim"

	-- save session and quit if close is true
	local session_str = string.format("mksession! %s%s", vim.fn.stdpath("data") .. "/session/", session_name)
	if close then
		vim.cmd(session_str)
		vim.cmd("qall")
	else
		vim.api.nvim_feedkeys(':'..session_str, 'n', true)
	end
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

	local is_term_buf = (vim.api.nvim_buf_get_option(buf_target, "buftype") == "terminal") and "!" or ""
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
				vim.cmd("bdelete "..b)
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
