# Alias definitions.


# General bash aliases
alias ls='ls -G'
alias now='date +"%Y-%m-%d %R:%S%T"'
alias ncake='/Users/chris/node_modules/coffee-script/bin/cake'
alias lipsum='node /Users/chris/bin.dropbox/lipsum.js'
alias lsbcuts='cat /Users/chris/Dropbox/home/bin/bash_shortcuts.list'
alias docx2txt='perl ~/bin.dropbox/docx2txt.pl'

# Pushbullet-bash
alias pushbullet="${HOME}/pushbullet-bash/pushbullet"

# Todo.txt General
alias t="${TODOTXT_APP_PATH} -d $TODOTXT_CFG_PATH"
alias ta='~/bin.dropbox/todo.sh -t add'
alias tl="~/bin.dropbox/todo.sh list "
alias tll="${TODOTXT_APP_PATH} list +log"


complete -F _todo t
complete -F _todo ta
complete -F _todo tl
complete -F _todo tlog


# Todo.txt for personal stuff
alias tlhw='~/bin.dropbox/todo.sh list -msu @waiting'
alias tlhc='~/bin.dropbox/todo.sh list -msu @computer'
alias jump='ssh -v -D 9001 -f -C -q -N chrisemaj7@christopherhowie.com'
alias schowie='ssh chrisemaj7@christopherhowie.com'

# MSU Todo aliases
alias mktunnel='ssh -v -D 9002 -f -C -q -N howiecha@dev.celta.msu.edu'
alias tam='~/bin.dropbox/todo.sh -t add +msu'
alias tlm='~/bin.dropbox/todo.sh list +msu'
alias tlmw='~/bin.dropbox/todo.sh list +msu @waiting'
alias tlmc='~/bin.dropbox/todo.sh list +msu @computer'
alias tlmp='~/bin.dropbox/todo.sh list +msu @phone'
#alias inbox="echo $1 | sed 's/^add //' >> ~/Dropbox/lists/inbox.txt"
alias inbox="echo $1"

complete -F _todo tlm


# Git
alias gipull="git pull --progress -v"
alias gush="git push --progress -v"

# Git lab aliases
alias glpull="git pull gitlab --progress -v"
alias glpush="git push gitlab --progress -v"

# SSH MSU
alias sforge='ssh howiecha@dev.cal.msu.edu'
alias scelta='ssh howiecha@celta.msu.edu'
alias scelta2='ssh howiecha@35.8.224.89'
alias sclear='ssh -p 8961 howiecha@clear.msu.edu'
alias sfms='ssh -p 8961 howiecha@fms.clear.msu.edu'
alias smedia1='ssh howiecha@media1.clear.msu.edu' 
alias scweb1='ssh howiecha@35.8.224.78'
alias swld='ssh howiecha@wld.clear.msu.edu'
alias sweb1='ssh howiecha@web1.celta.msu.edu'
alias sdev='ssh howiecha@dev.celta.msu.edu'
alias store2='ssh howiecha@store2.cal.msu.edu'
alias smaflt='ssh howiecha@maflt.cal.msu.edu'
alias sred5='ssh howiecha@red5.llc.msu.edu'
alias sweb2='ssh howiecha@35.8.224.120'
alias sjump='ssh -v -D 9001 -f -C -q -N howiecha@clear.msu.edu &'
alias smsuproxy='ssh -v -D 9003 -f -C -q -N howiecha@media1.clear.msu.edu &'

alias google-chrome='open /Applications/Google\ Chrome.app'
alias dsince='php ~/bin.dropbox/dsince.php $@';

# MySQL
alias mysql=/usr/local/mysql/bin/mysql
alias mysqldump=/usr/local/mysql/bin/mysqldump
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias mysqld_safe='sudo /usr/local/mysql/bin/mysqld_safe $1'
alias mysqld='sudo /Library/StartupItems/MySQLCOM/MySQLCOM $1'

alias mybak="mysqlbak -o ${HOME}/Sites/admin_scripts/data/$(date +"%Y-%m-%d_%R:%M:%S") -z"
alias soffice="/Applications/LibreOffice.app/Contents/MacOS/soffice --headless $1"

#vim: set ft=sh:

