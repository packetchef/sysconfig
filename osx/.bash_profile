# System-wide .profile for sh(1)
. /Users/william/.bashrc

PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/local/bin:/sw/bin:/Users/william/bin:/opt/local/bin:/opt/local/sbin:~/bin/wireshark"
export PATH

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh

#exec ssh-agent /bin/bash
#ssh-add .ssh/id_dsa
#ssh-add .ssh/id_rsa








############################################
# Modified from emilis bash prompt script
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
#
# Modified for Mac OS X by
# @corndogcomputer
###########################################
# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):

fill="--- "


reset_style='\[\033[00m\]'

status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color

prompt_style=$reset_style

command_style=$reset_style'\[\033[1;29m\]' # bold black

# Prompt variable:


PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "


# Reset color for command output

# (this one is invoked every time before a command is executed):

trap 'echo -ne "\033[00m"' DEBUG


function prompt_command {


# create a $fill of all screen width minus the time string and a space:

let fillsize=${COLUMNS}-9

fill=""

while [ "$fillsize" -gt "0" ]

do

fill="-${fill}" # fill with underscores to work on

let fillsize=${fillsize}-1

done


# If this is an xterm set the title to user@host:dir

case "$TERM" in

xterm*|rxvt*)

bname=`basename "${PWD/$HOME/~}"`

echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"

;;

*)

;;

esac


}

PROMPT_COMMAND=prompt_command


function safe_rm() {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

# from http://theappleblog.com/2009/03/26/terminal-tips-using-the-command-line-with-style/
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##
# Your previous /Users/william/.bash_profile file was backed up as /Users/william/.bash_profile.macports-saved_2009-04-04_at_15:48:30
##

# MacPorts Installer addition on 2009-04-04_at_15:48:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-04-04_at_15:48:30: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.


##
# Your previous /Users/william/.bash_profile file was backed up as /Users/william/.bash_profile.macports-saved_2009-09-25_at_18:53:21
##

# MacPorts Installer addition on 2009-09-25_at_18:53:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

function encrypt {
  if [ "$1" = "" ]; then
    echo "Usage: encrypt filename"
  elif [ -d "$1" ]; then
    echo ""$1" is a directory"
  elif [ -L "$1" ]; then
    echo ""$1" is a symbolic link"
  elif ! [ -r "$1" ]; then
    echo ""$1" is not readable"
  else
    /usr/bin/openssl aes-256-cbc -salt -in "$1" -out "$1".aes
      if [ $? -eq 0 ] ; then
        echo "encryted file: "$1".aes"
      fi
  fi
}

function decrypt {
  if [ "$1" = "" ] || [ "${1##*.}" != aes ]; then
    echo "Usage: decrypt filename.aes"
  else
    /usr/bin/openssl aes-256-cbc -d -salt -in "$1" -out "${1%.aes}" 2>/dev/null
      if [ $? -eq 0 ] ; then
        echo "decryted file: ${1%.aes}"
      else
        /bin/rm "${1%.aes}"
        echo -e "bad decrypt, possible incorrect password \n(${1%.aes} deleted)"
      fi
  fi
}

##
# Your previous /Users/william/.bash_profile file was backed up as /Users/william/.bash_profile.macports-saved_2009-11-26_at_14:29:38
##

# MacPorts Installer addition on 2009-11-26_at_14:29:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/william/.bash_profile file was backed up as /Users/william/.bash_profile.macports-saved_2011-05-14_at_10:55:24
##

# MacPorts Installer addition on 2011-05-14_at_10:55:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/william/.bash_profile file was backed up as /Users/william/.bash_profile.macports-saved_2011-09-05_at_12:19:24
##

# MacPorts Installer addition on 2011-09-05_at_12:19:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/william/.bash_profile file was backed up as /Users/william/.bash_profile.macports-saved_2013-01-29_at_19:45:43
##

# MacPorts Installer addition on 2013-01-29_at_19:45:43: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

