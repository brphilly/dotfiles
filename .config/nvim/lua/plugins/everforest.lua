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
					vim.api.nvim_set_hl(0, 'EyelinerPrimary', {fg="#e9e3d5", bold=true})
					vim.api.nvim_set_hl(0, 'EyelinerSecondary', {fg="#e4bbce", bold=true})
					vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', {sp="#859289", underline=true})
				end,
			})
		end,
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},
}
