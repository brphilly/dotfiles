local lsp_methods = require("lsp.methods")

local svelte = require("lspstart.svelte")
svelte.on_attach = function(client, buf)
	for method, f in pairs(lsp_methods) do
		if method ~= "textDocument/formatting" then
			f(client, buf)
		end
	end
end

local efm = require("lspstart.efm")
efm.on_attach = function(client, buf)
	lsp_methods["textDocument/formatting"](client, buf)
end

local tailwindcss = require("lspstart.tailwindcss")
tailwindcss.on_attach = function(client, buf)
	lsp_methods["textDocument/hover"](client, buf)
end

vim.api.nvim_create_autocmd("FileType", {
	group = "lsp",
	pattern = "svelte",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			vim.lsp.start(svelte)
			if
				#vim.fs.find(
					{ "tailwind.config.ts", "tailwind.config.js" },
					{ upward = true, type = "file", path = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)) }
				) > 0
			then
				vim.lsp.start(tailwindcss)
			end
			vim.lsp.start(efm)
		end
	end,
})
