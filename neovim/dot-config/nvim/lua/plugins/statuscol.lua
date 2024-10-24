return {
	{
		url = "https://github.com/luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					{
						sign = {
							namespace = { "^gitsigns_extmark_signs_$" },
							maxwidth = 1,
							colwidth = 1,
							auto = true,
							wrap = true,
						},
						click = "v:lua.ScSa",
					},
					{ sign = { namespace = { "/diagnostic/signs$" }, maxwidth = 0 } },
					{
						sign = { namespace = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = false },
						click = "v:lua.ScSa",
					},
					{ text = { " " }, click = "v:lua.ScSa" },
				},
			})
		end,
	},
}
