return {
	{
		url = "https://github.com/hrsh7th/cmp-path",
		lazy = true,
	},
	{
		url = "https://github.com/hrsh7th/cmp-buffer",
		lazy = true,
	},
	{
		url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		lazy = true,
	},
	{
		url = "https://github.com/hrsh7th/cmp-nvim-lua",
		lazy = true,
	},
	{
		url = "https://github.com/hrsh7th/cmp-cmdline",
		event = { "CmdlineEnter" },
		config = function()
			local cmp = require("cmp")
			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
				mapping = cmp.mapping.preset.cmdline(),
			})
			cmp.setup.cmdline("/", {
				sources = { { name = "buffer" } },
				mapping = cmp.mapping.preset.cmdline(),
			})
		end,
	},
	{
		url = "https://github.com/hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		dependencies = { "cmp-path", "cmp-buffer", "cmp-nvim-lsp", "cmp-nvim-lua" },
		config = function()
			local cmp = require("cmp")
			local compare = require("cmp.config.compare")
			cmp.setup({
				mapping = {
					["<C-Space>"] = function(fallback)
						if cmp.visible() then
							cmp.close()
						else
							cmp.complete()
						end
					end,
					["<c-n>"] = cmp.mapping.select_next_item(),
					["<c-p>"] = cmp.mapping.select_prev_item(),
					["<tab>"] = cmp.mapping.confirm({ select = true }),
				},

				confirmation = {
					get_commit_characters = function(commit_characters)
						return {}
					end,
				},

				preselect = cmp.PreselectMode.None,

				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},

				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[NVIM]",
							path = "[Path]",
						},
					}),
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
							local _, entry1_under = entry1.completion_item.label:find("^_+")
							local _, entry2_under = entry2.completion_item.label:find("^_+")
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
