unsetopt beep
HISTFILE="$XDG_CACHE_HOME/zsh/.zsh_history"
HISTSIZE=20000 # internal history
SAVEHIST=10000 # file history
setopt HIST_IGNORE_DUPS
KEYTIMEOUT=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

zle-keymap-select() {
	case $KEYMAP in
		vicmd) printf '\e[2 q';;
		viins|main) printf '\e[6 q';;
	esac
}
zle-line-init() { printf "\e[6 q" }
zle -N zle-keymap-select
zle -N zle-line-init
bindkey -v
bindkey -v '^?' backward-delete-char
bindkey -v '^w' backward-kill-word
bindkey -v '^u' backward-kill-line
bindkey -v '\e[H' vi-beginning-of-line
bindkey -v '\e[F' vi-end-of-line
bindkey -a '\e[H' vi-beginning-of-line
bindkey -a '\e[F' vi-end-of-line
bindkey -v $terminfo[kRIT5] forward-word
bindkey -v $terminfo[kLFT5] backward-word
bindkey -v '^@' menu-expand-or-complete
bindkey -v '^n' history-beginning-search-backward
bindkey -a 'w' forward-word
bindkey -a 'b' backward-word
bindkey -a 'Y' vi-yank-eol

source $XDG_CONFIG_HOME/zsh/aliases.zsh

zmodload zsh/complist
setopt AUTO_LIST
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^[' send-break

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:corrections' format '%F{#bf616a}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{#a3be8c}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format '%F{#a3be8c}-- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{#ebcb8b}-- no matches found --%f'

autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/.zcompdump
_comp_options+=(globdots) # Complete hidden files

source $XDG_CONFIG_HOME/zsh/prompt.zsh

ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c6f75'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

source $XDG_CONFIG_HOME/zsh/highlight.zsh # must be last
