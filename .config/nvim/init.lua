vim.g.mapleader = " "

_G.P = function(...) vim.pretty_print(...) end

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
