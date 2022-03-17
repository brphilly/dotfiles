source /usr/share/gitstatus/gitstatus.prompt.zsh
typeset -F SECONDS
cmd_start=$SECONDS
cmd_num=0
cmd_num_prev=-1

cmd_start() {
	cmd_start=$SECONDS
	((cmd_num++))
}
add-zsh-hook preexec cmd_start

prompt_dir() {
	print -Pv dir '%~'
	((gap = gap - ${(m)#dir} - 3)) # -3 is for spaces padding and seperator
	if [[ $1 -eq 0 ]]; then
		local dir_sep_bg='#5e81ac'
	elif [[ $prev_ret_code -ne 0 ]]; then
		local dir_sep_bg='#bf616a'
	else
		local dir_sep_bg='#20242d'
	fi
	PROMPT='%F{#20242d}%K{#a093c7} $dir %F{#a093c7}%K{'$dir_sep_bg'}'
}

prompt_git() {
	((gap = gap - $GITSTATUS_PROMPT_LEN - 3)) # -3 is for spaces padding and seperator
	if [[ $prev_ret_code -ne 0 ]]; then
		local dir_sep_bg='#bf616a'
	else
		local dir_sep_bg='#20242d'
	fi
	PROMPT+=" %F{#20242d}${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)} %F{#5e81ac}%K{"$dir_sep_bg"}"
}

prompt_ret() {
	((gap = gap - $#prev_ret_code - 3)) # -3 is for spaces padding and seperator
	PROMPT+="%F{#20242d} $prev_ret_code %F{#bf616a}%k"
}

prompt_elapsed() {
	elapsed_str=$((cmd_elapsed % 60))'s'
	local mins=$(((cmd_elapsed % 3600) / 60))
	if [[ $mins -ne 0 ]]; then
		elapsed_str="$mins""m $elapsed_str"
		local hours=$(((cmd_elapsed % 86400) / 3600))
		if [[ $hours -ne 0 ]]; then
			elapsed_str="$hours""h $elapsed_str"
			local days=$((cmd_elapsed / 86400))
			if [[ $days -ne 0 ]]; then
				elapsed_str="$days""d $elapsed_str"
			fi
		fi
	fi

	((gap = gap - $#elapsed_str - 3)) # -3 is for spaces padding and seperator
	elapsed_str='%F{#ebcb8b}%F{#20242d}%K{#ebcb8b} '"$elapsed_str "
}

prompt_time() {
	print -Pv pt '%D{%H:%M %b %d}'
	((gap = gap - $#pt - 3)) # -3 is for spaces padding and seperator
	if [[ $cmd_elapsed -gt 0 ]]; then
		local sep_bg='#ebcb8b'
	else
		local sep_bg='#20242d'
	fi
	prompt_full_time='%F{#d8dee9}%K{'"$sep_bg"'}%F{#20242d}%K{#d8dee9}'" $pt "
}

make_prompt() {
	prev_ret_code=$?
	local gap=$COLUMNS

	[[ -n $GITSTATUS_PROMPT ]]
	local is_git=$?
	prompt_dir $is_git
	[[ $is_git -eq 0 ]] && prompt_git
	[[ $prev_ret_code -ne 0 ]] && prompt_ret

	if [[ $cmd_num_prev -ne $cmd_num ]]; then
		integer -g cmd_elapsed=$((SECONDS - cmd_start))
		cmd_num_prev=$cmd_num
		elapsed_str=''
	fi
	[[ $cmd_elapsed -gt 0 ]] && prompt_elapsed
	prompt_time
	if [[ $gap -ge 0 ]]; then
		PROMPT+=$(printf '%'$gap'c' ' ')
		PROMPT+="$elapsed_str""$prompt_full_time"
	fi

	PROMPT+=$'\n''%f%k%(!.#.❯) '
}
add-zsh-hook precmd make_prompt

NEWLINE=$'\n'
