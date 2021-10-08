local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		}),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	},

	completion = {
		completeopt = "menuone,noinsert",
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
		ghost_text = true,
	},

	documentation = {
		border = "single",
	},

	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				path = "[Path]",
			},
		}),
	},

	-- You should specify your *installed* sources.
	sources = { -- this order affects priority
		{ name = "luasnip" },
		{
			name = "buffer",
			opts = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "path" },
	},
})

vim.cmd([[
augroup nvim-cmp-ft
autocmd!
autocmd FileType lua lua require'cmp'.setup.buffer {sources = {{name='luasnip'},{name='nvim_lsp'},{name='nvim_lua'},{name='path'}}}
autocmd FileType python,c,cpp lua require'cmp'.setup.buffer {sources = {{name='luasnip'},{name='nvim_lsp'},{name='path'}}}
augroup END
]])
vim.cmd([[doautoall nvim-cmp-ft FileType]])

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
	c.yellow,
	c.orange,
	c.fg,
	c.fg,
	c.purple,
	c.comment
))
vim.cmd(string.format([[doautocmd nvim-cmp-hl ColorScheme %s]], vim.g.colors_name))
