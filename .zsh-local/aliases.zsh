# NAVIGATION
alias ..="cd ../"
alias ...="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"

# SHORTCUTS
alias cdc="cd ~/Documents"
alias cdl="cd ~/Downloads"
alias cdt="cd ~/Desktop"
alias cdr="cd ~/Repos"

# LISTING
alias ls='lsd'
alias l="lsd -l"
alias la="lsd -la"
alias lt="lsd -lt"
alias lat="lsd -lat"
alias lrt="lsd -lrt"
alias lart="lsd -lart"
alias lS="lsd -lS"
alias las="lsd -laS"
alias lrs="lsd -lrS"
alias lars="lsd -larS"
alias ldot="lsd -ld .*"
alias tree="lsd --tree"

# FILES
alias cf="echo $(ls -1 | wc -l)"
alias mkf1="mkfile 1m ./1MB.dat"
alias mkf5="mkfile 5m ./5MB.dat"
alias mkf10="mkfile 10m ./10MB.dat"

# NETWORKING
alias myip="curl ifconfig.me"
alias lsock="sudo lsof -i -P"
alias lsocku="sudo lsof -nP | grep UDP"
alias lsockt="sudo lsof -nP | grep TCP"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# PROCESS MANAGEMENT
alias top="btop"

# SYSTEM MANAGEMENT
alias afk="osascript -e 'tell app \"System Events\" to key code 12 using {control down, command down}'"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup"

# VIM
alias vim="nvim"