return {
	{
		url = "https://github.com/rmagatti/auto-session",
		lazy = false,
		opts = {
			auto_session_suppress_dirs = { "~/", "/" },
			session_lens = {
				load_on_setup = false,
			},
			pre_save_cmds = { "fclose!" },
		},
	},
}
