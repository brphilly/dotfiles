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
-- stylua: ignore
vim.cmd(string.format([[
	augroup nvim-cmp-hl
	autocmd!
	autocmd ColorScheme nord highlight CmpItemAbbrMatch guifg=%s
	autocmd ColorScheme nord highlight CmpItemAbbrMatchFuzzy guifg=%s
	autocmd ColorScheme nord highlight CmpItemAbbr guifg=%s
	autocmd ColorScheme nord highlight CmpItemAbbrDeprecated guifg=%s gui=strikethrough
	autocmd ColorScheme nord highlight CmpItemKind guifg=%s
	autocmd ColorScheme nord highlight CmpItemMenu guifg=%s
	augroup END
]],
	c.attention,
	c.attention_alt,
	c.fg,
	c.fg,
	c.type,
	c.comment
))
vim.cmd(string.format([[doautocmd nvim-cmp-hl ColorScheme %s]], vim.g.colors_name))
