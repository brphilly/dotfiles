source $XDG_CONFIG_HOME/fish/env.fish

if status is-interactive
	set -g fish_greeting

	bind \t accept-autosuggestion
	bind -k nul complete

	abbr -a cd z
	abbr -a cdi zi
	abbr -a ls --position anywhere lsd
	abbr -a ll --position anywhere 'lsd -la'
	abbr -a cat --position anywhere bat
	abbr -a lg lazygit
	abbr -a yz yazi
	abbr -a pacdiff 'sudo DIFFPROG="env XDG_CONFIG_HOME=/home/brady/.config XDG_DATA_HOME=/home/brady/.local/share nvim -d" pacdiff'
	abbr -a paca 'paru --color always -Sl | sed -E \'s: :/:; s/ unknown-version//\' | fzf --multi --ansi --nth 1 --tiebreak index --preview \'paru -Si {1}\' | cut -d \' \' -f 1 | xargs -rot paru -S'
	abbr -a pacr 'paru --color always -Q | fzf --multi --ansi --nth 1 --preview \'paru -Qi {1}\' | cut -d \' \' -f 1 | xargs -rot paru -Rs'

	starship init fish | source
	zoxide init fish | source
end
