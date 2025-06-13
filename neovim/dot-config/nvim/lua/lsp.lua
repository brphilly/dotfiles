local augroup = "my.lsp"

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup(augroup, {}),
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
				group = vim.api.nvim_create_augroup(augroup, { clear = false }),
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
				group = vim.api.nvim_create_augroup(augroup, { clear = false }),
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

vim.lsp.config("efm", {
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
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if vim.fn.expand("<afile>:p") == vim.fn.getcwd() .. "/.nvim.lua" then
			client.config.name = "lua_ls_nvim"
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = {
						"lua/?.lua",
						"lua/?/init.lua",
					},
				},
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
			})
		end
	end,
	settings = { Lua = {} },
})

vim.lsp.config("ts_ls", { root_markers = { "tsconfig.json", "jsconfig.json", "package.json" } })
vim.lsp.config("denols", { root_markers = { "deno.json", "deno.jsonc" } })

vim.lsp.enable({
	"efm",
	"lua_ls",
	"basedpyright",
	"ruff",
	"ts_ls",
	"denols",
	"jsonls",
	"html",
	"cssls",
	"tailwindcss",
	"svelte",
})
