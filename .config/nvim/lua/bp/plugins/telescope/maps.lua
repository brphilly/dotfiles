local M = {}
local builtin = require("telescope.builtin")
local function conf_path() return vim.env.HOME.."/dotfiles" end
local function dir_path() return vim.fn.expand("%:p:h") end

function M.files_conf()
	builtin.find_files({
		cwd = conf_path(),
		prompt_title = "Find files in configs",
		hidden = true,
	})
end

function M.files_dir()
	local dir = dir_path()
	builtin.find_files({
		prompt_title = "Find files in " .. dir,
		cwd = dir,
	})
end

function M.files_cwd()
	local dir = vim.fn.getcwd()
	builtin.find_files({
		prompt_title = "Find files in " .. dir,
		cwd = dir,
	})
end

function M.files_home()
	local dir = vim.env.HOME
	builtin.find_files({
		prompt_title = "Find files in " .. dir,
		cwd = dir,
		hidden = true,
	})
end

function M.grep_dir()
	local dir = dir_path()
	builtin.live_grep({
		prompt_title = "Grep files in " .. dir,
		cwd = dir,
	})
end

function M.grep_cwd()
	local dir = vim.fn.getcwd()
	builtin.live_grep({
		prompt_title = "Grep files in " .. dir,
		cwd = dir,
	})
end

function M.grep_conf()
	builtin.live_grep({
		prompt_title = "Grep config",
		cwd = conf_path(),
		additional_args = function() return {"--hidden"} end
	})
end

function M.grep_home()
	local dir = vim.env.HOME
	builtin.live_grep({
		prompt_title = "Grep files in " .. dir,
		cwd = dir,
	})
end

function M.grep_bufs()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Grep buffers",
	})
end

local todo_str = "TODO(brphilly):"
function M.grep_todo_dir()
	local dir = dir_path()
	builtin.grep_string({
		cwd = dir,
		search = todo_str,
		search_dirs = { dir },
		prompt_title = "Grep todos in " .. dir,
	})
end

function M.grep_todo_cwd()
	local dir = vim.fn.getcwd()
	builtin.grep_string({
		cwd = dir,
		search = todo_str,
		search_dirs = { dir },
		prompt_title = "Grep todos in " .. dir,
	})
end

function M.grep_todo_conf()
	local dir = conf_path()
	builtin.grep_string({
		cwd = dir,
		vimgrep_arguments = {
			"rg",
			"--hidden",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--glob",
			"!XDG_CONFIG_HOME/nvim/lua/bp/plugins/telescope/maps.lua",
			"--glob",
			"!XDG_CONFIG_HOME/nvim/snippets/**",
		},
		search = todo_str,
		search_dirs = { dir },
		prompt_title = "Grep todos in config",
	})
end

function M.grep_todo_home()
	local dir = vim.env.HOME
	builtin.grep_string({
		cwd = dir,
		search = todo_str,
		search_dirs = { dir },
		prompt_title = "Grep todos in " .. dir,
	})
end

return M
