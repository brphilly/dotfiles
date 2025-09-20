return {
	{
		url = "https://github.com/luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{
						sign = {
							name = { ".*" },
							text = { ".*" },
							namespace = { ".*" },
							maxwidth = 2,
							colwidth = 1,
							auto = true,
							wrap = false,
						},
						click = "v:lua.ScSa",
					},
					{
						sign = {
							namespace = { "diagnostic" },
							maxwidth = 1,
							colwidth = 1,
							auto = true,
							wrap = true,
							click = "v:lua.ScSa",
						},
					},
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
					{ text = { builtin.lnumfunc },      click = "v:lua.ScLa" },
					{
						sign = {
							namespace = { "gitsigns" },
							maxwidth = 1,
							colwidth = 1,
							auto = true,
							wrap = true,
						},
						click = "v:lua.ScSa",
					},
					{ text = { " " }, click = "v:lua.ScSa" },
				},
			})
		end,
	},
}
