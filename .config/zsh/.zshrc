source $XDG_CONFIG_HOME/zsh/widgets.zsh
unsetopt beep
HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"
HISTSIZE=20000 # internal history
SAVEHIST=10000 # file history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_PUSHD PUSHD_MINUS PUSHD_SILENT PUSHD_TO_HOME CD_SILENT
KEYTIMEOUT=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

ZVM_INIT_MODE=sourcing
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

bindkey -M viins '^k' history-beginning-search-backward
bindkey -M viins '^j' history-beginning-search-forward

source $XDG_CONFIG_HOME/zsh/aliases.zsh

zmodload zsh/complist
setopt AUTO_LIST
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^[' send-break

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' cache-path "$XDG_DATA_HOME/zsh/zcompcache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:corrections' format '%F{#e67e80}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:messages' format '%F{#a7c080}-- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{#dbbc7f}-- no matches found --%f'

autoload -Uz compinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump
_comp_options+=(globdots) # Complete hidden files

source /usr/share/fzf/key-bindings.zsh
bindkey -v '^n' cd-down
bindkey -v '^p' cd-up
bindkey -v -s '^f' 'nvim $(fzf)^M'
source /usr/share/zsh/plugins/fzf-tab-bin-git/fzf-tab.plugin.zsh
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
bindkey -v '^@' fzf-tab-complete
bindkey -v '^i' forward-word
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

source $XDG_CONFIG_HOME/zsh/prompt.zsh

ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#859289'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

if [[ $+command[pyenv] ]]; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

eval "$(zoxide init zsh)"

source $XDG_CONFIG_HOME/zsh/highlight.zsh # must be last
