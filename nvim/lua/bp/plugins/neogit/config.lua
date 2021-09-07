require'neogit'.setup {
	disable_signs = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = false,
	-- customize displayed signs
	signs = {
		-- { CLOSED, OPENED }
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},
	integrations = {
		-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
		-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
		diffview = true
	},
	-- override/add mappings
	mappings = {
		-- modify status buffer mappings
		status = {
			-- Adds a mapping with "B" as key that does the "BranchPopup" command
			-- ["B"] = "BranchPopup",
			-- Removes the default mapping of "s"
			-- ["s"] = "",
		}
	}
}

vim.cmd [[
	augroup neogit-hl
	autocmd!
	autocmd ColorScheme nord highlight! link NeogitDiffAddHighlight DiffAdd
	autocmd ColorScheme nord highlight! link NeogitDiffDeleteHighlight DiffDelete
	autocmd ColorScheme nord highlight NeogitDiffContextHighlight guifg=fg
	autocmd ColorScheme nord highlight! link NeogitHunkHeader DiffChange
	autocmd ColorScheme nord highlight! link NeogitHunkHeaderHighlight DiffChange
	autocmd ColorScheme nord highlight! link NeogitNotificationInfo LspDiagnosticsDefaultInformation
	autocmd ColorScheme nord highlight! link NeogitNotificationWarning LspDiagnosticsDefaultWarning
	autocmd ColorScheme nord highlight! link NeogitNotificationError LspDiagnosticsDefaultError
	augroup END
]]
vim.cmd(string.format([[doautocmd neogit-hl ColorScheme %s]], vim.g.colors_name))
