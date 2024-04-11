export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR="nvim"
export LESS="-R"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_ASKPASS="lxqt-openssh-askpass"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--color=bg+:#3c4841,gutter:-1,info:#859289,header:#859289 --reverse --bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export LS_COLORS="$(vivid generate iceberg-dark)"
export BAT_THEME="gruvbox-dark"
export ZK_NOTEBOOK_DIR="$HOME/notes"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
