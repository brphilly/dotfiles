cd-root() {
	local dir=$(eval "fd --type d --exclude .git --exclude /sys --exclude /proc --exclude /dev --exclude /.btrfs-pool --exclude /run . / | fzf --height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS +m")
	if [[ -z "$dir" ]]; then
		zle redisplay
		return 0
	fi
	zle push-line # Clear buffer. Auto-restored on next prompt.
	BUFFER="builtin cd -- ${(q)dir}"
	zle accept-line
	local ret=$?
	unset dir # ensure this doesn't end up appearing in prompt expansion
	zle reset-prompt
	return $ret
}
zle -N cd-root
