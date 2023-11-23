alias sudo='sudo '
alias ls='lsd'
alias ll='lsd -la'
alias pacdiff='sudo DIFFPROG="env XDG_CONFIG_HOME=/home/brady/.config XDG_DATA_HOME=/home/brady/.local/share nvim -d" pacdiff'
alias lg='lazygit'
alias yz='yazi'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias cat='bat'
alias paca="paru --color always -Sl | sed -E 's: :/:; s/ unknown-version//' | fzf --multi --ansi --nth 1 --tiebreak index --preview 'paru -Si {1}' | cut -d ' ' -f 1 | xargs -rot paru -S"
alias pacs="paru --color always -Q | fzf --multi --ansi --nth 1 --preview 'paru -Qi {1}' | cut -d ' ' -f 1 | xargs -rt paru -Qi"
alias pacr="paru --color always -Q | fzf --multi --ansi --nth 1 --preview 'paru -Qi {1}' | cut -d ' ' -f 1 | xargs -rot paru -Rs"
