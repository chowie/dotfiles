#!/bin/bash

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

# Informix environment 
export INFORMIXDIR=/opt/ibm/informix
PATH=$PATH:$INFORMIXDIR/bin
export PATH


export CLIENTSDKDIR=/tmp

#source ${HOME}/bin/cpstore2.sh
#export -f cpstore2

#source ${HOME}/bin/cpstore2-completion.bash

alias mybak="sudo ${HOME}/bin/mysqlbak -o ${BACKUPDIR}/$(date +"%Y-%m-%d_%R:%M:%S") -z"


# Get the aliases and functions
#if [ -f ~/.bashrc ]; then
    #. ~/.bashrc
#fi

if [ -f ~/.bash_clear ]; then
    . ~/.bash_clear
fi

if [ -f ~/.bash_todotxt ]; then
    . ~/.bash_todotxt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#if [ -d /etc/bash_completion.d ] && ! shopt -oq posix; then
#if [ -d /etc/bash_completions.d ]; then
    #. /etc/bash_completions.d/*
#fi

#if [ -d ~/.bash_completions.d ]; then
    #for i in $(ls ~/.bash_completions.d/*); 
    #do
        #source $i;
    #done;
#fi

#if [ -d ~/.config ]; then
    #. ${HOME}/.config/*.conf
#fi

if [ -d $HOME/.bash_completions.d ] && ! shopt -oq posix; then
    for file in $HOME/.bash_completions.d/*; 
    do
        if [ -f "$file" ]; then
            . "$file";
        fi
        #. "$i"
    done;
fi

if [ -f ~/bin/time-tracker.sh  ]; then
    . ${HOME}/bin/time-tracker.sh;
fi

if [ -f ${HOME}/.time-tracker.conf  ]; then
    . ${HOME}/.time-tracker.conf;
fi

export HOMEBREW_GITHUB_API_TOKEN="0f1585be948228e826328dcbc394c223dde561c5"

#source /usr/local/etc/bash_completion.d/password-store


#CVS Environment variables
#export CVSROOT=$HOME/cvsroot
CVS_RSH="ssh" 
export CVS_RSH
export CVSROOT=:ext:chrish@scc.nictusa.com:/export/home/cvsroot
export CVSEDITOR="vim -u NONE"

# SSL config for pidgin 
export NSS_SSL_CBC_RANDOM_IV=0
VPNGRP=CDC
VPNUSER=nicusa\christopher.howie
VPNURL=https://ashburnra.cdc.nicusa.com

export ANDROID_HOME=${HOME}/.config/android-sdk 
#export PATH=${PATH}:${HOME}/.config/android-sdk/platform-tools:${HOME}/.config/android-sdk/tools

source ${HOME}/.asana.d/asana.conf

eval "$(pandoc --bash-completion)"


