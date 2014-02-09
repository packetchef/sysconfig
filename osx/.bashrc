# System-wide .bashrc file for interactive bash(1) shells.
if [ -n "$PS1" ]; then PS1='\h:\w \u\$ '; fi
# Make bash check it's window size after a process completes
shopt -s checkwinsize

PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/local/bin:/sw/bin:~/bin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:~/bin"
export PATH

alias shred='/usr/bin/srm'
alias ls='ls -Gh'
alias grep='grep --color'

alias vi=/usr/bin/vim
alias vim=/usr/bin/vim


# /opt/local/bin/fortune && echo ""

# Print working directory after a cd.
cd() {
    if [[ $@ == '-' ]]; then
        builtin cd "$@" > /dev/null  # We'll handle pwd.
    else
        builtin cd "$@"
    fi
    echo -e "   \033[1;30m"`pwd`"\033[0m"
}

