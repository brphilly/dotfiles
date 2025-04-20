vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method("textDocument/definition") then
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition({ buf = args.buf })
			end, { buffer = args.buf, desc = "Go to definition" })
		end

		if client:supports_method("textDocument/declaration") then
			vim.keymap.set("n", "gD", function()
				vim.lsp.buf.declaration({ buf = args.buf })
			end, { buffer = args.buf, desc = "Go to declaration" })
		end

		if client:supports_method("textDocument/typeDefinition") then
			vim.keymap.set("n", "gy", function()
				vim.lsp.buf.type_definition({ buf = args.buf })
			end, { buffer = args.buf, desc = "Go to type definition" })
		end

		if client:supports_method("textDocument/codeLens") then
			vim.keymap.set("n", "grA", vim.lsp.codelens.run, { buffer = args.buf, desc = "Run code lens" })

			vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
				buffer = args.buf,
				callback = function(_)
					vim.lsp.codelens.refresh({ bufnr = args.buf })
				end,
			})
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
				buffer = args.buf,
				callback = function()
					if not Disable_format_on_save then
						vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
					end
				end,
			})
		end
	end,
})

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
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").lua_ls.setup({
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
	on_new_config = function(config)
		config.settings = vim.tbl_deep_extend("force", config.settings, {
			python = {
				pythonPath = vim.get.cwd() .. "/.venv/bin/python",
			},
		})
	end,
	capabilities = require("lsp.capabilities"),
})
require("lspconfig").ruff.setup({
	capabilities = require("lsp.capabilities"),
})

vim.g.rustaceanvim = {
	server = {
		capabilities = require("lsp.capabilities"),
	},
}

require("lspconfig").ts_ls.setup({
	root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "package.json", "jsconfig.json"),
	capabilities = require("lsp.capabilities"),
	single_file_support = false,
})

require("lspconfig").denols.setup({
	root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").jsonls.setup({
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").html.setup({
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").cssls.setup({
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").tailwindcss.setup({
	capabilities = require("lsp.capabilities"),
})

require("lspconfig").svelte.setup({
	capabilities = require("lsp.capabilities"),
})
