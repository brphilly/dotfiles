return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			-- explorer = { enabled = true },
			image = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = {
				win = {
					input = {
						keys = {
							["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
							["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
							["<c-f>"] = { "list_scroll_down", mode = { "i", "n" } },
							["<c-b>"] = { "list_scroll_up", mode = { "i", "n" } },
						},
					},
				},
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			words = { enabled = true },
		},

		---@diagnostic disable:undefined-global
		keys = {
			{
				"<c-p>",
				function()
					Snacks.picker.smart({ hidden = true, mutli = { "buffers", "files" } })
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.grep({ hidden = true })
				end,
				desc = "Grep Files",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find Buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Find Git Commits",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.commands()
				end,
				desc = "Find Commands",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help({ confirm = "vsplit" })
				end,
				desc = "Find Help",
			},
			{
				"<leader>F",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume Find",
			},
		},
	},
}
