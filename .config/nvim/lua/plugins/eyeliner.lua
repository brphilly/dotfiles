return {
	{
		url = "https://github.com/jinh0/eyeliner.nvim",
		lazy = false,
		config = function()
			require("eyeliner").setup({
				highlight_on_key = false, -- show highlights only after keypress
				dim = true -- dim all other characters (for highlight_on_key = true)
			})
			vim.api.nvim_create_autocmd('InsertEnter', {command="EyelinerDisable"})
			vim.api.nvim_create_autocmd('InsertLeave', {command="EyelinerEnable"})
		end,
	},
}
