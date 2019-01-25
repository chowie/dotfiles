export TERM="xterm-256color"
alias vim="TERM=screen-256color vim"

export INFORMIXDIR=/opt/IBM/informix

export VISUAL=vim
export EDITOR="$VISUAL"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/bin:/sbin:$HOME/.composer/vendor/bin:$INFORMIXDIR/bin

# Path to your oh-my-zsh installation.
  export ZSH=/home/howiecha/.oh-my-zsh


autoload -Uz promptinit
promptinit
#POWERLINE_HIDE_USER_NAME="true"
#POWERLINE_PATH="short"
#POWERLINE_SHOW_GIT_ON_RIGHT="true"

# powerlevel9k settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon host dir rbenv dir_writable newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="howiecha1"
#ZSH_THEME="powerline"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git laravel5 zsh-syntax-highlighting chucknorris composer z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='gvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#

#prompt adam1
#PROMPT='
#$fg[cyan]%m: $fg[yellow]$(get_pwd)$(put_spacing)$(git_prompt_info)
#%F{red}→%f '
#RPROMPT='[%F{yellow}%?%f]'

source ~/.zshrc.history

# Because we are loading some bash scripts that need this in order to run
autoload bashcompinit
bashcompinit

source ~/.aliases

if [ -d ~/.bash_completions.d ]; then
    for i in `ls --color=never ~/.bash_completions.d/*`;
    do

        if [ ! -f "$i" ]
        then
            printf "${YELLOW} Warning! ${i} not found. ${NORMAL}  [skipping]\n"
            continue
        fi

        source "$i";
    done;
fi

#if [ -f ~/.bash_todotxt ]; then
    #. ~/.bash_todotxt
#fi

#CVS Environment variables
#export CVSROOT=$HOME/cvsroot
#CVS_RSH="ssh"
export CVS_RSH="ssh"
export CVSROOT=:ext:chrish@scc.nictusa.com:/export/home/cvsroot
export CVSEDITOR="vim -u NONE"

POWERLEVEL9K_VCS_FOREGROUND='white'
POWERLEVEL9K_VCS_BACKGROUND='teal'
# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='teal'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# Advanced `vi_mode` color customization
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'

export LESS='-C -R -M -I -j 10 -# 4'
export PAGER=less

source ~/bin/gtm-terminal-plugin/gtm-plugin.sh
source ~/bin/yesterworkday.sh 
