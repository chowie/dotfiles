#!/bin/bash

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1  ] && [ -n "$ncolors"  ] && [ "$ncolors" -ge 8  ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# Link files and dirs
APP_HOME=`pwd`

DOT_DIRS=(bin .todo .todo.actions.d)

link_file() {

    dir="${APP_HOME}/${1}"
    filename=$1
    source_path=$2
    source_file=${source_path}/${filename}
    target_file=${HOME}/${filename}
    echo "${target_file}"

    if [ -e "${target_file}" ]
    then
        echo "symlink for ${target_file} already exists... [skipping]"
        return;
    fi

    if [ ! -e "${source_file}" ]
    then
        echo "${source_file} does not exist... [skipping]"
        return;
    fi

    ln -s "${source_file}" "${target_file}"

}

for i in ${DOT_DIRS[@]};
do
    link_file $i "${APP_HOME}"
done

# symlink bash files
for i in `ls -a --color=never ${APP_HOME}/bash | grep bash`;
do
    link_file $i "${APP_HOME}/bash"
done

# symlink zsh files
for i in `ls -a --color=never ${APP_HOME}/zsh | grep zsh`;
do
    link_file $i "${APP_HOME}/zsh"
done

# symlink git files
for i in `ls -a --color=never ${APP_HOME}/git | grep git`;
do
    link_file $i "${APP_HOME}/git"
done

# symlink git files
for i in `ls -a --color=never ${APP_HOME}/vim | grep vim`;
do
    link_file $i "${APP_HOME}/vim"
done

ln -s "${APP_HOME}/oh-my-zsh" "$HOME/.oh-my-zsh"

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
install_zsh() {

    printf "Installing ${GREEN}oh-my-zsh${NORMAL}...\n"

    if [ -d "$ZSH" ]; then
        printf "${YELLOW}You already have Oh My Zsh installed.${NORMAL}\n"
        printf "You'll need to remove $ZSH if you want to re-install.\n"
        exit
    fi

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

}

#install_zsh
