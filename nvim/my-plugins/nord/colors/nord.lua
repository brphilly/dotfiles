local utils = require'nord.utils'

vim.g.colors_name = 'nord'

local hl_groups = require'nord.hl-groups'
vim.cmd(utils.build_hlstr('Normal', hl_groups.Normal))
for hlgroup,opts in pairs(hl_groups) do
	vim.cmd(utils.build_hlstr(hlgroup, opts))
end
