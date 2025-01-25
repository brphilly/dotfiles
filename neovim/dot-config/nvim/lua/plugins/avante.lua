return {
	{
		"yetone/avante.nvim",
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "claude",
			claude = {
				api_key_name = "cmd:secret-tool lookup api anthropic",
			},
			vendors = {
				openrouter = {
					__inherited_from = "openai",
					api_key_name = "cmd:secret-tool lookup api openrouter",
					endpoint = "https://openrouter.ai/api/v1",
					model = "deepseek/deepseek-chat",
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
		},
	},
}
