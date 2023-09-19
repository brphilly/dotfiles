autoload -Uz add-zsh-hook
source /usr/share/gitstatus/gitstatus.prompt.zsh
VIRTUAL_ENV_DISABLE_PROMPT=1
typeset -F SECONDS
cmd_start=$SECONDS
new_cmd="false"

cmd_start() {
	cmd_start=$SECONDS
	new_cmd="true"
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

prompt_day_suffix() {
	local day=$(print -P "%D{%-d}")
	local suffix
	if [[ $day = "1" ]] || [[ $day = "21" ]] || [[ $day = "31" ]]; then suffix="st"
	elif [[ $day = "2" ]] || [[ $day = "22" ]]; then suffix="nd"
	elif [[ $day = "3" ]] || [[ $day = "23" ]]; then suffix="rd"
	else suffix="th"
	fi
	echo " $day$suffix "
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
	prev_ret=$(print -P '%(?..%?)')
	psvar[1]=$(print -P '%~')
	[[ -n $VIRTUAL_ENV ]] && psvar[1]="(${VIRTUAL_ENV##*/}) $psvar[1]"
	psvar[2]=${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)}
	if [[ $new_cmd == "true" ]]; then
		psvar[3]=$prev_ret
		psvar[5]=$(prompt_elapsed)
		new_cmd="false"
	else
		psvar[3]=""
		psvar[5]=""
	fi
	psvar[6]=$(print -P '%D{%H:%M %a}')$(prompt_day_suffix)$(print -P '%D{%b}')
	prompt_gap # set psvar[4]
}
add-zsh-hook precmd make_prompt

BG=#272e33
FG=#d3c6aa
DIR=#a7c080
GIT=#83c092
RET=#e67e80
TIME=#dbbc7f

PROMPT="%F{$BG}%K{$DIR} %1v %F{$DIR}%2(V.%K{$GIT}.%3(V.%K{$RET}.%k))"
PROMPT+="%2(V.%F{$BG} %2v %F{$GIT}%3(V.%K{$RET}.%k).)"
PROMPT+="%3(V.%F{$BG} %3v %F{$RET}%k.)"
PROMPT+="%4v"
PROMPT+="%5(V.%F{$TIME}%F{$BG}%K{$TIME} %5v .)"
PROMPT+="%F{$FG}%5(V.%K{$TIME}.)%F{$BG}%K{$FG} %6v "
PROMPT+=$'\n'"%f%k%(!.#.❯) "
