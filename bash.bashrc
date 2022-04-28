# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.
WHIT_TEXT='\033[38;5;230m'
PINK_TEXT='\033[38;5;211m'
BLUE_TEXT='\033[38;5;45m'
BLACK_TEXT='\033[40m'
PUR_TEXT='\033[95m'
BLACK='\033[30m'
BLUE='\033[48;2;92;206;250m'
PINK='\033[48;2;245;169;184m'
WHIT='\033[48;2;255;255;255m'
NC='\033[0m' # No Color
for i in {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#\e[0m" ; done ; echo
printf "${BLUE_TEXT} __                          __        __                         __         ${NC}\n"
printf "${BLUE_TEXT}/\ \                        /\ \      /\ \                       /\ \        ${NC}\n"
printf "${BLUE_TEXT}\ \ \       __  __      __  \ \/ ____ \ \ \____     __       ____\ \ \___    ${NC}\n"
printf "${PINK_TEXT} \ \ \  __ /\ \/\ \   / __ \ \/ / ,__\ \ \ '__ \  /'__ \    / ,__⑊\ \  _  \  ${NC}\n"
printf "${WHIT_TEXT}  \ \ \L\ ⑊\ \ \_\ \ /\ \L\ \_ /\__,  \ \ \ \L\ \/\ \L\ \_ /\__,  ⑊\ \ \ \ \ ${NC}\n"
printf "${PINK_TEXT}   \ \____/ \ \____ ⑊\ \__/ \_⑊\/\____/  \ \_,__/\ \__/ \_⑊\/\____/ \ \_\ \_⑊${NC}\n"
printf "${BLUE_TEXT}    \/___/   \/___/> ⑊\/__/\/_/ \/___/    \/___/  \/__/\/_/ \/___/   \/_/\/_/${NC}\n"
printf "${BLUE_TEXT}                /\___/                                                       ${NC}\n"
printf "${BLUE_TEXT}                \/__/                                                        ${NC}\n"
for i in {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#\e[0m" ; done ; echo
printf "${BLACK}${BLUE_TEXT}𝖇𝖊𝖓𝖊𝖆𝖙𝖍 𝖙𝖍𝖊      ${NC}\n"
printf "${BLACK}${PINK_TEXT} 𝖙𝖍𝖊 𝖘𝖈𝖆𝖗𝖑𝖊𝖙 𝖒𝖔𝖔𝖓 ${NC}\n"
printf "${BLACK}${WHIT_TEXT}   𝖙𝖍𝖊 𝖈𝖗𝖆𝖟𝖊𝖉    ${NC}\n"
printf "${BLACK}${PINK_TEXT}     𝖇𝖑𝖔𝖘𝖘𝖔𝖒𝖘   ${NC}\n"
printf "${BLACK}${BLUE_TEXT}      𝖘𝖊𝖛𝖊𝖗𝖆𝖓𝖈𝖊  ${NC}\n"
for i in {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#\e[0m" ; done ; echo
echo -e "\e[95mHi i hope you're having a good day "

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1="\[$(tput bold)\]\[\033[38;5;62m\]@\[$(tput sgr0)\]\[\033[38;5;61m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;195m\][\[$(tput sgr0)\]\[\033[38;5;111m\]\t\[$(tput sgr0)\]\[\033[38;5;195m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;216m\]{\[$(tput sgr0)\]\[\033[38;5;211m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;216m\]}\[$(tput sgr0)\] :\[$(tput sgr0)\]"
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi