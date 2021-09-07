local M = {}
local builtin = require'telescope.builtin'

function M.files_conf()
	builtin.find_files {
		cwd = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h:p'),
		prompt_title = "Find files in configs",
		hidden = true,
	}
end

function M.files_dir()
	local dir = vim.fn.expand('%:p:h')
	builtin.find_files {
		prompt_title = "Find files in "..dir,
		cwd = dir,
	}
end

function M.files_proj()
	local dir = vim.b.proj_root
	builtin.find_files {
		prompt_title = "Find files in "..dir,
		cwd = dir,
	}
end

function M.files_cwd()
	local dir = vim.fn.getcwd()
	builtin.find_files {
		prompt_title = "Find files in "..dir,
		cwd = dir,
	}
end

function M.files_home()
	local dir = vim.env.HOME
	builtin.find_files {
		prompt_title = "Find files in "..dir,
		cwd = dir,
		hidden = true,
	}
end

function M.grep_dir()
	local dir = vim.fn.expand('%:p:h')
	builtin.live_grep {
		prompt_title = "Grep files in "..dir,
		cwd = dir,
	}
end

function M.grep_proj()
	local dir = vim.b.proj_root or ''
	builtin.live_grep {
		prompt_title = "Grep files in "..dir,
		cwd = dir or nil,
	}
end

function M.grep_cwd()
	local dir = vim.fn.getcwd()
	builtin.live_grep {
		prompt_title = "Grep files in "..dir,
		cwd = dir,
	}
end

function M.grep_conf()
	builtin.live_grep {
		prompt_title = "Grep config",
		cwd = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h:p'),
	}
end

function M.grep_home()
	local dir = vim.env.HOME
	builtin.live_grep {
		prompt_title = "Grep files in "..dir,
		cwd = dir,
	}
end

function M.grep_bufs()
	builtin.live_grep {
		grep_open_files = true,
		prompt_title = "Grep buffers",
	}
end

local todo_str = 'TODO(brphilly):'
function M.grep_todo_dir()
	local dir = vim.fn.expand('%:p:h')
	builtin.grep_string {
		cwd = dir,
		search = todo_str,
		search_dirs = {dir},
		prompt_title = "Grep todos in "..dir,
	}
end

function M.grep_todo_proj()
	local dir = vim.b.proj_root
	builtin.grep_string {
		cwd = dir,
		search = todo_str,
		search_dirs = {dir},
		prompt_title = "Grep todos in "..dir,
	}
end

function M.grep_todo_cwd()
	local dir = vim.fn.getcwd()
	builtin.grep_string {
		cwd = dir,
		search = todo_str,
		search_dirs = {dir},
		prompt_title = "Grep todos in "..dir,
	}
end

function M.grep_todo_conf()
	local dir = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h:p')
	builtin.grep_string {
		cwd = dir,
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--glob',
			'!nvim/lua/bp/plugins/telescope/maps.lua',
			'--glob',
			'!nvim/snippets/**',
		},
		search = todo_str,
		search_dirs = {dir},
		prompt_title = "Grep todos in config",
	}
end

function M.grep_todo_home()
	local dir = vim.env.HOME
	builtin.grep_string {
		cwd = dir,
		search = todo_str,
		search_dirs = {dir},
		prompt_title = "Grep todos in "..dir,
	}
end

function M.browse_dir()
	local dir = vim.fn.expand('%:p:h')
	builtin.file_browser {
		cwd = dir,
	}
end

function M.browse_proj()
	local dir = vim.b.proj_root
	builtin.file_browser {
		cwd = dir,
	}
end

function M.browse_cwd()
	local dir = vim.fn.getcwd()
	builtin.file_browser {
		cwd = dir,
	}
end

function M.browse_conf()
	builtin.file_browser {
		cwd = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h:p'),
	}
end

function M.browse_home()
	local dir = vim.env.HOME
	builtin.file_browser {
		cwd = dir,
	}
end

function M.git_commits()
	local dir = vim.b.proj_root
	builtin.git_commits {
		cwd = dir,
	}
end

function M.git_bcommits()
	local dir = vim.b.proj_root
	builtin.git_bcommits {
		cwd = dir,
	}
end

function M.git_branches()
	local dir = vim.b.proj_root
	builtin.git_branches {
		cwd = dir,
	}
end

function M.git_status()
	local dir = vim.b.proj_root
	builtin.git_status {
		cwd = dir,
	}
end

return M
