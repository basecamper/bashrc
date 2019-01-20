#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
ORANGE="\[$(tput setaf 3)\]"
CLEAR="\[$(tput sgr0)\]"

exitstatus() {
	status=$?
	[[ $status != 0 ]] && echo "[ ${status} ]"
}

get_mem() {
	awk '/MemFree/{print $2}' /proc/meminfo
}

[[ $UID == 0 ]]	&& PS1="${RED}"'$(exitstatus)'"${CLEAR}[ $(get_mem) ]${ORANGE}[ ${RED}\u${CLEAR}@\h \W${ORANGE} ]${CLEAR}> " \
		|| PS1="${RED}"'$(exitstatus)'"${CLEAR}[ $(get_mem) ]${ORANGE}[${CLEAR} \u@\h \W${ORANGE} ]${CLEAR}> "

[ -e /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias l='ls -ahl'
alias vi='vim'

