return {
	{
		url = "https://github.com/sainnhe/everforest",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_ui_contrast = "high"
			vim.api.nvim_create_autocmd('ColorScheme', {pattern = 'everforest',
				callback = function()
					vim.api.nvim_set_hl(0, 'TelescopeNormal', {link = "NormalFloat"})
					vim.api.nvim_set_hl(0, 'TelescopeBorder', {link = "FloatBorder"})
				end,
			})
		end,
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},
}
