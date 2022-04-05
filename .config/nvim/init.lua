vim.g.mapleader = " "

_G.P = function(arg) print(vim.inspect(arg)) end
vim.augroup = function(group) return vim.api.nvim_create_augroup(group, {}) end
vim.autocmd = function(group, event, action, pat)
	return vim.api.nvim_create_autocmd(event, {
		callback = type(action) == "function" and action or nil,
		command = type(action) == "string" and action or nil,
		pattern = pat,
		group = group,
	})
end

-- New lua-based filetype detection
vim.g.do_filetype_lua = 1

-- work around #17867
if vim.env.TERM == 'xterm-kitty' then
  vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
  vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end

-- Disable builtin plugins:
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_spellfile_plugin = 1
-- vim.g.loaded_tarPlugin = 1 -- treesitter needs this
vim.g.loaded_2html_plugin = 1
vim.g.loaded_zipPlugin = 1
