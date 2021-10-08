require("neogit").setup({
	disable_insert_on_commit = false,
	integrations = {
		-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
		-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
		diffview = true,
	},
})

vim.cmd([[
	augroup NeogitCommitMessage
	autocmd!
	autocmd FileType NeogitCommitMessage runtime! ftplugin/gitcommit.vim
	augroup END
]])

vim.cmd([[
	augroup neogit-hl
	autocmd!
	autocmd ColorScheme nord highlight! link NeogitDiffAddHighlight DiffAdd
	autocmd ColorScheme nord highlight! link NeogitDiffDeleteHighlight DiffDelete
	autocmd ColorScheme nord highlight NeogitDiffContextHighlight guifg=fg
	autocmd ColorScheme nord highlight! link NeogitHunkHeader DiffChange
	autocmd ColorScheme nord highlight! link NeogitHunkHeaderHighlight DiffChange
	autocmd ColorScheme nord highlight! link NeogitNotificationInfo DiagnosticInfo
	autocmd ColorScheme nord highlight! link NeogitNotificationWarning DiagnosticWarn
	autocmd ColorScheme nord highlight! link NeogitNotificationError DiagnosticError
	augroup END
]])
vim.cmd(string.format([[doautocmd neogit-hl ColorScheme %s]], vim.g.colors_name))
