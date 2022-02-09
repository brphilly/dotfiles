switch (uname)
	case Darwin
		fish_add_path /usr/local/bin /usr/local/sbin /usr/local/opt/python/libexec/bin
		set -gx XDG_DATA_HOME $HOME/.local/share
		set -gx XDG_CONFIG_HOME $HOME/.config
		set -gx EDITOR nvim
end

set -gx BAT_THEME Nord

if status is-interactive
	# Commands to run in interactive sessions can go here
	alias ls="exa"
	alias ll="exa -lag"
	alias cat="bat"
	alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

	function fish_vi_cursor; end
	fish_vi_key_bindings insert
	fzf_key_bindings

	function fish_greeting; end
	function fish_mode_prompt
		switch $fish_bind_mode
			case default
				printf '\e[2 q'
			case insert
				printf '\e[6 q'
			case replace_one
				printf '\e[4 q'
			case visual
		end
	end

	set -g _prompt_mode "insert"
	function fish_prompt
		set -l cmd_status $status
		set -l gap $COLUMNS

		set_color $fish_color_cwd
		set -l dir (prompt_pwd)
		printf " %s " $dir
		set gap (math -s0 $gap - (string length $dir) - 2)

		if set -l git (fish_git_prompt)
			set_color a093c7 --background=5e81ac
			echo -n ""
			set gap (math -s0 $gap - 1)

			set_color 20242d
			set git (string sub --start=3 --end=-1 $git)
			printf " %s " $git
			set gap (math -s0 $gap - (string length $git) - 2)

			if test $cmd_status -eq 0
				set_color 5e81ac --background=20242d
				echo -n ""
				set gap (math -s0 $gap - 1)
			else
				set_color 5e81ac --background=bf616a
				echo -n ""
				set gap (math -s0 $gap - 1)
				set_color 20242d
				printf " %s " $cmd_status
				set_color bf616a --background=20242d
				echo -n ""
				set gap (math -s0 $gap - (string length $cmd_status) - 3)
			end
		else
			if test $cmd_status -eq 0
				set_color a093c7 --background=20242d
				echo -n ""
				set gap (math -s0 $gap - 1)
			else
				set_color a093c7 --background=bf616a
				echo -n ""
				set gap (math -s0 $gap - 1)
				set_color 20242d
				printf " %s " $cmd_status
				set_color bf616a --background=20242d
				echo -n ""
				set gap (math -s0 $gap - (string length $cmd_status) - 3)
			end
		end

		if test "$_prompt_mode" = "$fish_bind_mode"
			set -g _prompt_time (date "+ %H:%M %b %-d ")
		end
		set -g _prompt_mode $fish_bind_mode
		set gap (math -s0 $gap - (string length $_prompt_time) - 1)

		set -l secs (math -s0 $CMD_DURATION / 1000)
		set -l dur " "
		if test $secs -ne 0
			set dur (string join "s" (math -s0 $secs % 60) $dur)
			set -l mins (math -s0 \($secs % 3600\) / 60)
			if test $mins -ne 0
				set dur (string join "m " $mins $dur)
				set -l hours (math -s0 \($secs % 86400\) / 3600)
				if test $hours -ne 0
					set dur (string join "h " $hours $dur)
					set -l days (math -s0 $secs / 86400)
					if test $days -ne 0
						set dur (string join "d " $days $dur)
					end
				end
			end
			set dur (string join "" " " $dur)
			set gap (math -s0 $gap - (string length $dur) - 1)
		end

		if test $gap -ge 0
			printf (printf "%%%ss" $gap) ""
			if test $secs -ne 0
				set_color ebcb8b --background=20242d
				echo -n ""
				set_color 20242d --background=ebcb8b
				echo -n $dur
				set_color d8dee9 --background=ebcb8b
				echo -n ""
				set_color 20242d --background=d8dee9
				echo -n $_prompt_time
			else
				set_color d8dee9 --background=20242d
				echo -n ""
				set_color 20242d --background=d8dee9
				echo -n $_prompt_time
			end
		end
		set_color normal
		printf "\n❯ "
	end
end
