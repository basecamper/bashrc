#
# ~/.bashrc
#
[[ $- != *i* ]] && return

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
ORANGE="\[$(tput setaf 3)\]"
CLEAR="\[$(tput sgr0)\]"

exitstatus() {
	status=$?
	if [[ $status != 0 ]]; then
		echo "[ ${status} ]"
	fi
}

get_mem() {
	awk '/MemFree/{print $2 " " $3}' /proc/meminfo
}

[ -e /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias l='ls -ahl'
alias vi='vim'
if [ "$UID" == "0" ]; then
	PS1="${RED}"'$(exitstatus)'"${CLEAR}[ $(get_mem) ]${ORANGE}[ ${RED}\u${CLEAR}@\h \W${ORANGE} ]${CLEAR}> "
else
	PS1="${RED}"'$(exitstatus)'"${CLEAR}[ $(get_mem) ]${ORANGE}[${CLEAR} \u@\h \W${ORANGE} ]${CLEAR}> "
fi
