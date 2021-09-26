local cmp = require('cmp')
cmp.setup {
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},

	completion = {
		completeopt = 'menuone,noinsert',
	},

	confirmation = {
		get_commit_characters = function(commit_characters)
			commit_characters = {}
			return commit_characters
		end,
	},

	snippet = {
		expand = function(args)
			require'luasnip'.lsp_expand(args.body)
		end
	},

	preselect = cmp.PreselectMode.Item,

	experimental = {
		ghost_text = true,
	},

	documentation = {
		border = 'single',
	},

	formatting = {
		format = function(entry, vim_item)
			-- set a name for each source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				path = '[Path]',
			})[entry.source.name]
			return vim_item
		end,
	},

	-- You should specify your *installed* sources.
	sources = { -- this order affects priority
		{name = 'luasnip'},
		{
			name = 'buffer',
			opts = {get_bufnrs = function() return vim.api.nvim_list_bufs() end},
		},
		{name = 'path'},
	},
}

vim.cmd [[
augroup nvim-cmp-ft
autocmd!
autocmd FileType lua lua require'cmp'.setup.buffer {sources = {{name='luasnip'},{name='nvim_lsp'},{name='nvim_lua'},{name='path'}}}
autocmd FileType python,c,cpp lua require'cmp'.setup.buffer {sources = {{name='luasnip'},{name='nvim_lsp'},{name='path'}}}
augroup END
]]
vim.cmd [[doautoall nvim-cmp-ft FileType]]
