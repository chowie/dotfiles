# .bash_profile

## Get the aliases and functions
#if [ -f ~/.bashrc ]; then
    #. ~/.bashrc
#fi

# User specific environment and startup programs

PS1="\[\e[0;31m\]\w →\[\e[m\] "

LOGDIR_APACHE=/var/log/apache2

BACKUPDIR=/var/backups/mysql
export BACKUPDIR

PATH=$PATH:$HOME/bin:/sbin:$HOME/.composer/vendor/bin
export PATH

# My IP Address
MYIP=`echo "${SSH_CLIENT%% *}"`
export MYIP

alias scanlog="sudo grep -iE ^\(\[0-9\]\{1,3\}\.*\)\{4\}.*\(union\|from\) $LOGDIR_APACHE/access_log" # | awk '{ printf "%-15s\t%3d\t%-21s\t%-100s\n", $1, $9, $4, $7};'"
alias debugit="sudo grep $MYIP LOGDIR_APACHE/error_log"

#source ${HOME}/bin/cpstore2.sh
#export -f cpstore2

#source ${HOME}/bin/cpstore2-completion.bash

alias mybak="sudo ${HOME}/bin/mysqlbak -o ${BACKUPDIR}/$(date +"%Y-%m-%d_%R:%M:%S") -z"


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.bash_clear ]; then
    . ~/.bash_clear
fi

if [ -f ~/.bash_todotxt ]; then
    . ~/.bash_todotxt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

