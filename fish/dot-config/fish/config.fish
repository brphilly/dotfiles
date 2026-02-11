source ~/.config/fish/env.fish

if status is-interactive
	set -g fish_greeting

	fish_vi_key_bindings insert

	abbr -a cd z
	abbr -a cdi zi
	abbr -a ls --position anywhere lsd
	abbr -a ll --position anywhere 'lsd -la'
	abbr -a cat --position anywhere bat
	abbr -a lg lazygit
	abbr -a ljj lazyjj
	abbr -a yz yazi
	abbr -a paca 'paru --color always -Sl | sed -E \'s: :/:; s/ unknown-version//\' | fzf --multi --ansi --nth 1 --tiebreak index --preview \'paru -Si {1}\' | cut -d \' \' -f 1 | xargs -rot paru -S'
	abbr -a pacr 'paru --color always -Q | fzf --multi --ansi --nth 1 --preview \'paru -Qi {1}\' | cut -d \' \' -f 1 | xargs -rot paru -Rs'

	fish_add_path -gP ~/.local/bin
	fish_add_path -gP ~/.cargo/bin
	starship init fish | source
	zoxide init fish | source
	atuin init fish --disable-up-arrow | source
end


function fish_user_key_bindings
    bind -M insert tab accept-autosuggestion
    bind -M insert ctrl-space complete
end

function storePathForWindowsTerminal --on-variable PWD
    if test -n "$WT_SESSION"
      printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
    end
end
