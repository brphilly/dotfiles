vim.g.mapleader = " "

_G.P = function(...) vim.print(...) end

-- chezmoi filetype detection
vim.filetype.add({
	filename = {
		[vim.env.XDG_DATA_HOME.."/chezmoi/dot_zshenv"] = "zsh",
		[vim.env.XDG_DATA_HOME.."/chezmoi/private_dot_config/zsh/dot_zshrc"] = "zsh",
		[vim.env.XDG_DATA_HOME.."/chezmoi/private_dot_config/git/config"] = "gitconfig",
		[vim.env.XDG_DATA_HOME.."/chezmoi/private_dot_config/git/ignore"] = "gitignore",
		[vim.env.XDG_DATA_HOME.."/chezmoi/private_dot_ssh/config"] = "sshconfig",
		["dot_editorconfig"] = "dosini",
	},
})
