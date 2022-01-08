# Create a new directory and enter it
mkd() {
	mkdir -p "$@" && cd "$_"
}

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
	diff() {
		git diff --no-index --color-words "$@"
	}
fi


# Determine size of a file or total size of a directory
fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* ./*
	fi
}

# Create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" }

# Extract most know archives with one command
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)	tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar e $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find a file whose name starts with a given string
ffs () { find . -type f -name "$@"'*' }

# Find a file whose name ends with a given string
ffe () { find . -type f -name '*'"$@" }

# Find out the pid of a specified process
fpid () { lsof -t -c "$@" }

# List processes owned by the current user
myps () { ps $@ -u $USER -o pid,%cpu,%mem,start,time,command }
