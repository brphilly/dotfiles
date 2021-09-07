local M = {}

-- TODO(brphilly): Improve below

function M.rooter(start_directory, cb)

end

function M.proj_root(autocmd)
	local buf = 0
	local proj_root = ''
	if autocmd then
		buf = vim.fn.expand('<abuf>')
		proj_root = vim.fn.expand('<afile>:p:h')
		if proj_root == '' then
			return
		end
	else
		buf = vim.api.nvim_get_current_buf()
		proj_root = vim.fn.expand('%:p:h')
	end
	vim.api.nvim_buf_set_var(buf, 'proj_root', proj_root)

	local stdout = vim.loop.new_pipe()
	vim.loop.spawn('git', {
		args = {
			'rev-parse',
			'--absolute-git-dir',
		},
		stdio = {nil, stdout},
		cwd = proj_root
	}, function(code)
			if code == 0 then
				local proj_root = {}
				vim.loop.read_start(stdout, function(err, data)
					assert(not err, err)
					if data then
						table.insert(proj_root, data)
					else
						vim.schedule(function()
							proj_root = vim.fn.fnamemodify(table.concat(proj_root), ':h:p')
							vim.api.nvim_buf_set_var(buf, 'proj_root', proj_root)
						end)
						vim.loop.close(stdout)
					end
				end)
			else
				vim.loop.close(stdout)
			end
		end)
end

return M
