return {
	{
		url = "https://github.com/ThePrimeagen/harpoon",
		branch = "harpoon2",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>m", function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Show harpoon menu" })
			vim.keymap.set("n", "m<leader>", function()
				require("harpoon"):list():add()
			end, { desc = "Harpoon buffer" })
			vim.keymap.set("n", "[b", function()
				require("harpoon"):list():prev()
			end, { desc = "Switch to previous harpoon" })
			vim.keymap.set("n", "]b", function()
				require("harpoon"):list():next()
			end, { desc = "Switch to next harpoon" })
			for i = 1, 9 do
				vim.keymap.set("n", "m" .. i, function()
					require("harpoon"):list():select(i)
				end, { desc = "Switch to harpoon " .. i })
			end
		end,
	},
}
