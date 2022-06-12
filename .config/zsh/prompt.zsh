autoload -Uz add-zsh-hook
source /usr/share/gitstatus/gitstatus.prompt.zsh
VIRTUAL_ENV_DISABLE_PROMPT=1
typeset -F SECONDS
cmd_start=$SECONDS
cmd_num=0
cmd_num_prev=-1

cmd_start() {
	cmd_start=$SECONDS
	(( cmd_num++ ))
}
add-zsh-hook preexec cmd_start

prompt_elapsed() {
	integer elapsed_sec=$((SECONDS - cmd_start))
	local elapsed_arr=()

	local days=$((elapsed_sec / 86400))
	[[ $days -ne 0 ]] && elapsed_arr+=(${days}d)

	local hours=$(((elapsed_sec % 86400) / 3600))
	( [[ $#elapsed_arr -ne 0 ]] || [[ $hours -ne 0 ]] ) && elapsed_arr+=(${hours}h)

	local mins=$(((elapsed_sec % 3600) / 60))
	( [[ $#elapsed_arr -ne 0 ]] || [[ $mins -ne 0 ]] ) && elapsed_arr+=(${mins}m)

	local secs=$((elapsed_sec % 60))
	( [[ $#elapsed_arr -ne 0 ]] || [[ $secs -ne 0 ]] ) && elapsed_arr+=(${secs}s)

	echo ${(j[ ])elapsed_arr}
}

prompt_gap() {
	local left_prompt_size=$(( ${(m)#psvar[1]} + ${(m)#psvar[2]} + $#psvar[3] ))
	(( left_prompt_size += 3 )) # for psvar[1] padding and seperator
	[[ $#psvar[2] -ne 0 ]] && (( left_prompt_size += 3 ))
	[[ $#psvar[3] -ne 0 ]] && (( left_prompt_size += 3 ))

	local right_prompt_size=$(( $#psvar[5] + $#psvar[6] ))
	(( right_prompt_size += 3)) # for psvar[6] padding and seperator
	[[ $#psvar[5] -ne 0 ]] && (( right_prompt_size += 3 ))

	local prompt_gap
	if [[ $right_prompt_size -ge $COLUMNS ]]; then
		prompt_gap=0
	elif [[ $(( (left_prompt_size % COLUMNS) + right_prompt_size )) -le $COLUMNS ]]; then
		prompt_gap=$(( COLUMNS - right_prompt_size - (left_prompt_size % COLUMNS) ))
	else
		prompt_gap=$(( 2 * COLUMNS - right_prompt_size - (left_prompt_size % COLUMNS) ))
	fi

	psvar[4]=$(printf "%${prompt_gap}c" ' ')
}

make_prompt() {
	psvar[3]=$(print -P '%(?..%?)')
	psvar[1]=$(print -P '%~')
	[[ -n $VIRTUAL_ENV ]] && psvar[1]="(${VIRTUAL_ENV##*/}) $psvar[1]"
	psvar[2]=${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)}
	if [[ $cmd_num_prev -ne $cmd_num ]]; then
		cmd_num_prev=$cmd_num
		psvar[5]=$(prompt_elapsed)
	fi
	psvar[6]=$(print -P '%D{%H:%M %b %d}')
	prompt_gap # set psvar[4]
}
add-zsh-hook precmd make_prompt

PROMPT="%F{#20242d}%K{#a093c7} %1v %F{#a093c7}%2(V.%K{#5e81ac}.%3(V.%K{#bf616a}.%k))"
PROMPT+="%2(V.%F{#20242d} %2v %F{#5e81ac}%3(V.%K{#bf616a}.%k).)"
PROMPT+="%3(V.%F{#20242d} %3v %F{#bf616a}%k.)"
PROMPT+="%4v"
PROMPT+="%5(V.%F{#ebcb8b}%F{#20242d}%K{#ebcb8b} %5v .)"
PROMPT+="%F{#d8dee9}%5(V.%K{#ebcb8b}.)%F{#20242d}%K{#d8dee9} %6v "
PROMPT+=$'\n'"%f%k%(!.#.❯) "
