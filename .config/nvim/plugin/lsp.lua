vim.api.nvim_create_augroup("lsp", {})
local lsp_methods = require("lsp.methods")

require("lspconfig").efm.setup({
	filetypes = { "lua", "typescript", "javascript", "json", "jsonc", "html", "css", "svelte" },
	settings = {
		languages = {
			lua = { require("efmls-configs.formatters.stylua") },
			typescript = { require("efmls-configs.formatters.prettier"), require("efmls-configs.linters.eslint") },
			javascript = { require("efmls-configs.formatters.prettier"), require("efmls-configs.linters.eslint") },
			json = { require("efmls-configs.formatters.prettier") },
			jsonc = { require("efmls-configs.formatters.prettier") },
			html = { require("efmls-configs.formatters.prettier") },
			css = { require("efmls-configs.formatters.prettier") },
			svelte = { require("efmls-configs.formatters.prettier"), require("efmls-configs.linters.eslint") },
		},
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	on_attach = lsp_methods["textDocument/formatting"],
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").lua_ls.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	on_new_config = function(config)
		if vim.fn.expand("<afile>:p") == vim.fn.getcwd() .. "/.nvim.lua" then
			config.name = "lua_ls_nvim"
			config.settings = vim.tbl_deep_extend("force", config.settings, {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = { vim.env.VIMRUNTIME },
					},
				},
			})
		end
	end,
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").basedpyright.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	capabilities = require("lsp.capabilities"),
})
require("lspconfig").ruff_lsp.setup({
	on_attach = lsp_methods["textDocument/formatting"],
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").rust_analyzer.setup({
	on_attach = function(client, buf)
		for _, f in pairs(lsp_methods) do
			f(client, buf)
		end
	end,
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").tsserver.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").jsonls.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").html.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").cssls.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").tailwindcss.setup({
	on_attach = lsp_methods["textDocument/hover"],
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").svelte.setup({
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	capabilities = require("lsp.capabilities"),
})
