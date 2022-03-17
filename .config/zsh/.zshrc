unsetopt beep
export KEYTIMEOUT=1
bindkey -v
bindkey -v '^?' backward-delete-char

source $XDG_CONFIG_HOME/zsh/aliases.zsh

autoload -U compinit; compinit -d $XDG_CACHE_HOME/zsh/.zcompdump
_comp_options+=(globdots) # Complete hidden files

autoload -U add-zsh-hook
source $XDG_CONFIG_HOME/zsh/prompt.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
