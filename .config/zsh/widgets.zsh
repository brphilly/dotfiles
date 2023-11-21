cd-cmd() {
	local dir=$(eval $1)
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

cd-down() {
	local dir="fd --type d --hidden --exclude .git --exclude /sys --exclude /proc --exclude /dev --exclude /.btrfs-pool --exclude /run . . | fzf --height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS +m"
	cd-cmd $dir
}
zle -N cd-down

parents() {
	local input=$1
    if [[ $input != "/" ]] then
        local parent=$(dirname $input)
        printf '%s\0' $parent
        parents $parent
    fi
}

cd-up() {
	local dir="parents $(pwd) | fzf --read0 --height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS +m"
	cd-cmd $dir
}
zle -N cd-up
