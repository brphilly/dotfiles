local cmp = require("cmp")
local compare = require("cmp.config.compare")
cmp.setup({
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
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
				nvim_lua = "[NVIM]",
				luasnip = "[LuaSnip]",
				path = "[Path]",
			})[entry.source.name]
			vim_item.dup = entry.source.name == "nvim_lua" and 0 or 1
			return vim_item
		end
	},

	sorting = {
		priority_weight = 2,
		comparators = {
			compare.offset,
			compare.exact,
			-- compare.scopes,
			compare.score,
			-- copied from cmp-under
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find "^_+"
				local _, entry2_under = entry2.completion_item.label:find "^_+"
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,
			-- compare.recently_used,
			-- compare.locality,
			compare.kind,
			-- compare.sort_text,
			compare.length,
			compare.order,
		},
	},

	-- You should specify your *installed* sources.
	sources = {
		-- this order affects priority
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
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
