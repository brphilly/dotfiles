local maps = '<cmd>lua require"bp.plugins.telescope.maps".'
local builtin = '<cmd>lua require"telescope.builtin".'
local skeymap = vim.api.nvim_set_keymap

skeymap('n', '<leader>ffd', maps..'files_dir()<cr>', {noremap = true})
skeymap('n', '<leader>ffp', maps..'files_proj()<cr>', {noremap = true})
skeymap('n', '<leader>ffw', maps..'files_cwd()<cr>', {noremap = true})
skeymap('n', '<leader>ffc', maps..'files_conf()<cr>', {noremap = true})
skeymap('n', '<leader>ffh', maps..'files_home()<cr>', {noremap = true})
skeymap('n', '<leader>ffo', builtin..'oldfiles()<cr>', {noremap = true})

skeymap('n', '<leader>fb', builtin..'buffers()<cr>', {noremap = true})
skeymap('n', '<leader>fh', builtin..'help_tags()<cr>', {noremap = true})
skeymap('n', '<leader>fr', builtin..'registers()<cr>', {noremap = true})
skeymap('n', '<leader>fm', builtin..'marks()<cr>', {noremap = true})
skeymap('n', '<leader>fq', builtin..'quickfix()<cr>', {noremap = true})
skeymap('n', '<leader>fl', builtin..'loclist()<cr>', {noremap = true})

skeymap('n', '<leader>fsd', maps..'grep_dir()<cr>', {noremap = true})
skeymap('n', '<leader>fsp', maps..'grep_proj()<cr>', {noremap = true})
skeymap('n', '<leader>fsw', maps..'grep_cwd()<cr>', {noremap = true})
skeymap('n', '<leader>fsc', maps..'grep_conf()<cr>', {noremap = true})
skeymap('n', '<leader>fsh', maps..'grep_home()<cr>', {noremap = true})
skeymap('n', '<leader>fsb', maps..'grep_bufs()<cr>', {noremap = true})
skeymap('n', '<leader>fs%', builtin..'current_buffer_fuzzy_find()<cr>', {noremap = true})

skeymap('n', '<leader>fdr', builtin..'lsp_references()<cr>', {noremap = true})
skeymap('n', '<leader>fds', builtin..'lsp_document_symbols()<cr>', {noremap = true})
skeymap('n', '<leader>fdws', builtin..'lsp_workspace_symbols()<cr>', {noremap = true})
skeymap('n', '<leader>fdc', builtin..'lsp_code_actions()<cr>', {noremap = true})
skeymap('x', '<leader>fdc', ':lua require"telescope.builtin".lsp_range_code_actions()<cr>', {noremap = true})
skeymap('n', '<leader>fdd', builtin..'lsp_document_diagnostics()<cr>', {noremap = true})
skeymap('n', '<leader>fdwd', builtin..'lsp_workspace_diagnostics()<cr>', {noremap = true})
skeymap('n', '<leader>fdt', builtin..'treesitter()<cr>', {noremap = true})

skeymap('n', '<leader>ftd', maps..'grep_todo_dir()<cr>', {noremap = true})
skeymap('n', '<leader>ftp', maps..'grep_todo_proj()<cr>', {noremap = true})
skeymap('n', '<leader>ftw', maps..'grep_todo_cwd()<cr>', {noremap = true})
skeymap('n', '<leader>ftc', maps..'grep_todo_conf()<cr>', {noremap = true})
skeymap('n', '<leader>fth', maps..'grep_todo_home()<cr>', {noremap = true})

skeymap('n', '<leader>f-d', maps..'browse_dir()<cr>', {noremap = true})
skeymap('n', '<leader>f-p', maps..'browse_proj()<cr>', {noremap = true})
skeymap('n', '<leader>f-w', maps..'browse_cwd()<cr>', {noremap = true})
skeymap('n', '<leader>f-c', maps..'browse_conf()<cr>', {noremap = true})
skeymap('n', '<leader>f-h', maps..'browse_home()<cr>', {noremap = true})

skeymap('n', '<leader>fgc', maps..'git_commits()<cr>', {noremap = true})
skeymap('n', '<leader>fg%', maps..'git_bcommits()<cr>', {noremap = true})
skeymap('n', '<leader>fgb', maps..'git_branches()<cr>', {noremap = true})
skeymap('n', '<leader>fgs', maps..'git_status()<cr>', {noremap = true})
