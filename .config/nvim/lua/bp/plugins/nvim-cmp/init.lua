local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		}),
		["<c-y>"] = cmp.mapping.confirm({select = false}),
		["<c-e>"] = cmp.mapping.abort(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	},

	completion = {
		completeopt = "menuone,noselect",
	},

	confirmation = {
		get_commit_characters = function(commit_characters)
			commit_characters = {}
			return commit_characters
		end,
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	preselect = cmp.PreselectMode.Item,

	experimental = {
		ghost_text = {hl_group = 'NonText'},
	},

	window = {
		documentation = {
			border = "rounded",
		},
		completion = {
			border = "single",
		},
	},

	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s%s", require("bp.plugins.nvim-cmp.kind-icons")[vim_item.kind], vim_item.kind)
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Nvim-Lua]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end
	},

	sorting = {
		priority_weight = 1,
	},

	-- You should specify your *installed* sources.
	sources = {
		-- this order affects priority
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "buffer", keyword_length = 2 },
	},
})
cmp.setup.cmdline('/', {
	sources = { { name = 'buffer' } },
	mapping = cmp.mapping.preset.cmdline(),
})
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
	mapping = cmp.mapping.preset.cmdline(),
})

local c = require("nord.colours")
vim.api.nvim_create_augroup("nvim-cmp-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "nvim-cmp-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {fg = c.attention})
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {fg = c.attention_alt})
	vim.api.nvim_set_hl(0, "CmpItemAbbr", {fg = c.fg})
	vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {fg = c.fg, strikethrough = true})
	vim.api.nvim_set_hl(0, "CmpItemKind", {fg = c.type})
	vim.api.nvim_set_hl(0, "CmpItemMenu", {fg = c.comment})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "nvim-cmp-hl", pattern = vim.g.colors_name})
