local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			-- You must install `vim-vsnip` if you use the following as-is.
			vim.fn['vsnip#anonymous'](args.body)
		end
	},

	documentation = {
		border = 'single',
	},

	-- TODO(brphilly): Sort out below
	-- You must set mapping if you want.
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-e>'] = cmp.mapping.close(),
		-- ['<CR>'] = cmp.mapping.confirm({
		-- 	behavior = cmp.ConfirmBehavior.Insert,
		-- 	select = false,
		-- })
	},

	completion = {
		completeopt = 'menuone,noinsert',
	},
	preselect = cmp.PreselectMode.None,

	formatting = {
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			-- vim_item.kind = require("lspkind").presets.default[vim_item.kind]
			-- 	.. " "
			-- 	.. vim_item.kind

			-- set a name for each source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				vsnip = "[Vsnip]",
				nvim_lua = "[Lua]",
				path = '[Path]',
			})[entry.source.name]
			return vim_item
		end,
	},

	-- You should specify your *installed* sources.
	sources = { -- this order affects priority
		{name = 'vsnip'},
		{name = 'buffer'},
		{name = 'path'},
	},
}

vim.cmd [[
augroup nvim-cmp-ft
autocmd!
autocmd FileType lua lua require'cmp'.setup.buffer {sources = {{name='vsnip'},{name='nvim_lsp'},{name='nvim_lua'},{name='path'}}}
autocmd FileType python,c,cpp lua require'cmp'.setup.buffer {sources = {{name='vsnip'},{name='nvim_lsp'},{name='path'}}}
augroup END
]]
vim.cmd [[doautoall nvim-cmp-ft FileType]]
