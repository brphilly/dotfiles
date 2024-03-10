local lsp_methods = require("lsp.methods")

local no_format_attach = function(client, buf)
	for method, f in pairs(lsp_methods) do
		if method ~= "textDocument/formatting" then
			f(client, buf)
		end
	end
end

local cssls = require("lspstart.cssls")
cssls.on_attach = no_format_attach

local efm = require("lspstart.efm")
efm.on_attach = function(client, buf)
	lsp_methods["textDocument/formatting"](client, buf)
end

local tailwindcss = require("lspstart.tailwindcss")
tailwindcss.on_attach = no_format_attach

vim.api.nvim_create_autocmd("FileType", {
	group = "lsp",
	pattern = { "css", "scss", "less" },
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			if
				#vim.fs.find(
					{ "tailwind.config.ts", "tailwind.config.js" },
					{ upward = true, type = "file", path = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)) }
				) > 0
			then
				vim.lsp.start(tailwindcss)
			else
				vim.lsp.start(cssls)
			end
			vim.lsp.start(efm)
		end
	end,
})
