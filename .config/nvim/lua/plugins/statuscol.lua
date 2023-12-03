return {
	{
		url = "https://github.com/luukvbaal/statuscol.nvim",
		branch = "0.10",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
					{ text = {
						function(args)
							local diags = vim.diagnostic.get(args.buf, {lnum = args.lnum - 1})
							local severity = math.huge
							for _, diag in ipairs(diags) do
								if diag.severity < severity then severity = diag.severity end
							end
							local hl = ""
							if severity == vim.diagnostic.severity.HINT then
								hl = "%#DiagnosticSignHint#"
							elseif severity == vim.diagnostic.severity.INFO then
								hl = "%#DiagnosticSignInfo#"
							elseif severity == vim.diagnostic.severity.WARN then
								hl = "%#DiagnosticSignWarn#"
							elseif severity == vim.diagnostic.severity.ERROR then
								hl = "%#DiagnosticSignError#"
							end
							return hl
						end,
						builtin.lnumfunc,
					}, click = "v:lua.ScLa" },
					{
						sign = { namespace = { "gitsigns" }, maxwidth=1, colwidth=1, auto = true, wrap = true },
						click = "v:lua.ScSa",
					},
					{ text = { " " }, click = "v:lua.ScSa", },
					{
						sign = { namespace = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = false },
						click = "v:lua.ScSa",
					},
				},
			})
		end,
	},
}
