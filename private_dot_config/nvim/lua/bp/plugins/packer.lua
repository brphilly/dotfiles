require("packer").startup({
	function()
		local use = require("packer").use

		-- Not lazy loaded:
		use({
			"sainnhe/everforest",
			config = function()
				vim.g.everforest_background = "hard"
				vim.g.everforest_diagnostic_virtual_text = "colored"
				vim.g.everforest_enable_italic = 1
				vim.g.everforest_ui_contrast = "high"
				vim.api.nvim_create_autocmd('ColorScheme', {pattern = 'everforest',
					callback = function()
						vim.api.nvim_set_hl(0, 'EyelinerPrimary', {fg="#e9e3d5", bold=true})
						vim.api.nvim_set_hl(0, 'EyelinerSecondary', {fg="#e4bbce", bold=true})
						vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', {sp="#859289", underline=true})
					end,
				})
				vim.cmd("colorscheme everforest")
			end
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			config = 'require("bp.plugins.nvim-treesitter")',
			run = ":TSUpdate",
			requires = {
				{
					"nvim-treesitter/nvim-treesitter-textobjects",
					config = 'require("bp.plugins.nvim-treesitter-textobjects")',
					after = "nvim-treesitter",
				},
				{
					"nvim-treesitter/playground",
					config = 'require("bp.plugins.nvim-treesitter-playground")',
					cmd = "TSPlaygroundToggle",
					as = "nvim-treesitter-playground",
					wants = "nvim-treesitter",
				},
			},
		})

		use({"kosayoda/nvim-lightbulb", config = "require('bp.plugins.nvim-lightbulb')"})
		use({"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"})
		use({
			"j-hui/fidget.nvim",
			tag = "legacy",
			config = function()
				require("fidget").setup({ text = { spinner = "dots_negative" }, window = { relative = "editor" },
					fmt = { stack_upwards = false } }
				)
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			config = 'require("bp.plugins.lualine")',
			wants = { "nvim-web-devicons" },
			event = "VimEnter", -- wants key requires lazy loading to work properly
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
			},
		})

		use {
			'jinh0/eyeliner.nvim',
			config = function()
				require'eyeliner'.setup {
					highlight_on_key = false, -- show highlights only after keypress
					dim = true -- dim all other characters (for highlight_on_key = true)
				}
				vim.api.nvim_create_autocmd('InsertEnter', {command="EyelinerDisable"})
				vim.api.nvim_create_autocmd('InsertLeave', {command="EyelinerEnable"})
			end
		}

		use({
			"mhinz/vim-startify",
			setup = 'require("bp.plugins.vim-startify")',
		})

		use({
			"rcarriga/nvim-notify",
			config = 'require("bp.plugins.nvim-notify")',
		})

		use({
			"stevearc/dressing.nvim",
			config = function()
				require('dressing').setup({
					input = {insert_only = false, start_in_insert = false, mappings = {n = {["<C-c>"] = "Close"}, i = {["<C-c>"] = false}}}
				})
			end,
		})

		use({
			"https://gitlab.com/yorickpeterse/nvim-pqf",
			config = function() require("pqf").setup() end,
		})

		use({
			'akinsho/git-conflict.nvim',
			config = function() require('git-conflict').setup({default_mappings = false}) end,
		})

		use({
			"chaoren/vim-wordmotion",
			setup = 'require("bp.plugins.vim-wordmotion")',
		})

		use({
			"wellle/targets.vim",
		})

		-- Lazy loaded:
		use({
			"kevinhwang91/nvim-bqf",
			config = "require('bp.plugins.nvim-bqf')",
			ft = "qf",
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = 'require("bp.plugins.indent-blankline")',
			event = { "BufReadPre", "BufNewFile" },
		})

		use({
			"lewis6991/gitsigns.nvim",
			config = 'require("bp.plugins.gitsigns")',
			event = { "BufReadPre", "BufNewFile" },
			wants = "plenary.nvim",
			requires = { { "nvim-lua/plenary.nvim", opt = true } },
		})

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
			event = { "BufReadPre", "BufNewFile" },
		})

		use({
			"windwp/nvim-autopairs",
			config = function() require('nvim-autopairs').setup({}) end,
			event = "InsertEnter",
		})

		use({
			"abecodes/tabout.nvim",
			config = function() require("tabout").setup({completion = false}) end,
			event = "InsertEnter",
			wants = "nvim-treesitter",
		})

		use({
			"hrsh7th/nvim-cmp",
			config = 'require("bp.plugins.nvim-cmp")',
			event = { "InsertEnter", "CmdlineEnter" },
			requires = {
				{ "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp", opt = true },
				{
					"hrsh7th/cmp-buffer",
					after = "nvim-cmp",
					opt = true,
				},
				{
					"saadparwaiz1/cmp_luasnip",
					after = "nvim-cmp",
					opt = true,
				},
				{
					"hrsh7th/cmp-nvim-lsp",
					after = "nvim-cmp",
					opt = true,
				},
				{
					"hrsh7th/cmp-nvim-lua",
					after = "nvim-cmp",
					opt = true,
				},
			},
		})
		use({
			"L3MON4D3/LuaSnip",
			config = 'require("bp.plugins.luasnip")',
			event = "InsertEnter",
		})

		use({
			"nvim-telescope/telescope.nvim",
			config = 'require("bp.plugins.telescope.config")',
			setup = 'require("bp.plugins.telescope.setup")',
			module = "telescope",
			wants = { "nvim-web-devicons", "plenary.nvim" },
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
				{ "nvim-lua/plenary.nvim", opt = true },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make",
					after = "telescope.nvim",
					config = function()
						require("telescope").load_extension("fzf")
					end,
				},
				{
					"nvim-telescope/telescope-frecency.nvim",
					after = "telescope.nvim",
					wants = "sqlite.lua",
					setup = function()
						vim.keymap.set("n", "<leader>ffB", function() require('telescope').extensions.frecency.frecency() end)
					end,
					config = function()
						require("telescope").load_extension("frecency")
					end,
					requires = { { "tami5/sqlite.lua", opt = true } },
				},
			},
		})

		use({
			"ThePrimeagen/harpoon",
			setup = 'require("bp.plugins.harpoon.setup")',
			module = "harpoon",
		})

		use({
			"lambdalisue/suda.vim",
			cmd = { "SudaRead", "SudaWrite" },
		})

		use({
			"rlane/pounce.nvim",
			config = "require('bp.plugins.pounce')",
			setup = function()
				vim.keymap.set("n", "s", "<cmd>Pounce<cr>")
				vim.keymap.set("n", "S", "<cmd>PounceRepeat<cr>")
				vim.keymap.set("x", "s", "<cmd>Pounce<cr>")
				vim.keymap.set("o", "z", "<cmd>Pounce<cr>")
			end,
			cmd = { "Pounce", "PounceRepeat" },
		})

		-- stylua: ignore start
		use({
			"numToStr/Comment.nvim",
			config = function() require("Comment").setup({ ignore = "^$" }) end,
			keys = {
				{"n", "gc"}, {"n", "gb"},
				{"x", "gc"}, {"x", "gb"},
			},
		})
		-- stylua: ignore end

		-- stylua: ignore
		use({
			"tpope/vim-surround",
			setup = "require('bp.plugins.vim-surround')",
			keys = {
				{"n","ds"}, {"n","cs"}, {"n","cS"}, {"n","ys"}, {"n","yS"}, {"n","yss"}, {"n","ySs"}, {"n","ySS"},
				{"x","S"}, {"x","gS"},
			},
			wants = "vim-repeat",
			requires = {{"tpope/vim-repeat", opt = true}},
		})

		use({
			"kyazdani42/nvim-tree.lua",
			setup = function()
				vim.keymap.set("n", "-", "<cmd>NvimTreeToggle<cr>")
			end,
			config = 'require("bp.plugins.nvim-tree.config")',
			cmd = "NvimTreeToggle",
			wants = "nvim-web-devicons",
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
			},
		})

		use({
			"mbbill/undotree",
			setup = function()
				vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
				vim.g.undotree_WindowLayout = 2
				vim.g.undotree_SetFocusWhenToggle = 1
			end,
			cmd = "UndotreeToggle",
		})

		use({
			"wbthomason/packer.nvim",
			config = 'require("bp.plugins.packer")',
			cmd = {
				"PackerInstall",
				"PackerUpdate",
				"PackerSync",
				"PackerClean",
				"PackerCompile",
				"PackerProfile",
				"PackerStatus",
				"PackerLoad",
			},
		})
	end,
	config = {
		compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
		auto_reload_compiled = false,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
