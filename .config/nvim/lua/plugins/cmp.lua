local cmp_kinds
local plugspec = {
	{
		url = "https://github.com/hrsh7th/cmp-path",
		event = { "InsertEnter" },
	},
	{
		url = "https://github.com/hrsh7th/cmp-buffer",
		event = { "InsertEnter" },
	},
	{
		url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		-- event = { "InsertEnter" },
	},
	{
		url = "https://github.com/hrsh7th/cmp-nvim-lua",
		event = { "InsertEnter" },
	},
	{
		url = "https://github.com/hrsh7th/cmp-cmdline",
		event = { "CmdlineEnter" },
		dependencies = {"cmp-path", "cmp-buffer"},
		config = function()
			local cmp = require("cmp")
			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
				mapping = cmp.mapping.preset.cmdline(),
			})
			cmp.setup.cmdline("/", {
				sources = { { name = 'buffer' } },
				mapping = cmp.mapping.preset.cmdline(),
			})
		end,
	},
	{
		url = "https://github.com/hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		config = function()
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

				preselect = cmp.PreselectMode.Item,

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
						vim_item.kind = string.format("%s%s", cmp_kinds[vim_item.kind], vim_item.kind)
						-- Source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[NVIM]",
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

				sources = {
					-- this order affects priority
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
				},
			})
		end,
	},
}
cmp_kinds = {
	Text = ' ',
	Method = ' ',
	Function = ' ',
	Constructor = ' ',
	Field = ' ',
	Variable = ' ',
	Class = ' ',
	Interface = ' ',
	Module = ' ',
	Property = ' ',
	Unit = ' ',
	Value = ' ',
	Enum = ' ',
	Keyword = ' ',
	Snippet = ' ',
	Color = ' ',
	File = ' ',
	Reference = ' ',
	Folder = ' ',
	EnumMember = ' ',
	Constant = ' ',
	Struct = ' ',
	Event = ' ',
	Operator = ' ',
	TypeParameter = ' ',
}
return plugspec
