vim.api.nvim_set_keymap('i', '<S-Tab>', [[luaeval('require"bp.plugins.luasnip".snippet_jump("<S-Tab>")')]], {expr = true})

-- Write any lua snippets before this
require'luasnip.loaders.from_vscode'.load {paths = {'./snippets'}}

local M = {}
function M.snippet_jump(key)
	if require'luasnip'.expand_or_jumpable() then
		return vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true)
	else
		return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
	end
end
return M
