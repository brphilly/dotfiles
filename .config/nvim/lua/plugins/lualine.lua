return {
	{
		url = "https://github.com/nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			options = {
				icons_enabled = true,
				theme = "everforest",
				component_separators = { left = "", right = "" },
				section_separators = "",
				disabled_filetypes = {},
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{ "diagnostics", sources = { "nvim_diagnostic" } },
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { { "filename", path = 1 }, "filetype" },
				lualine_z = { "%v", "%l/%L" },
			},
			extensions = { "lazy", "quickfix" },
		},
	},
}
