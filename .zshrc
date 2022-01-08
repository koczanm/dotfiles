ZPLUG_HOME=$(brew --prefix)/opt/zplug
source "${HOME}/.zplug/init.zsh"

# Load oh-my-zsh plugins
zplug "lib/clipboard",             from:oh-my-zsh
zplug "lib/completion",            from:oh-my-zsh
zplug "lib/history",               from:oh-my-zsh
zplug "plugins/brew",              from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize",          from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/docker-compose",    from:oh-my-zsh
zplug "plugins/fzf",               from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/git-lfs",           from:oh-my-zsh
zplug "plugins/kubectl",           from:oh-my-zsh
zplug "plugins/macos",             from:oh-my-zsh
zplug "plugins/pipenv",            from:oh-my-zsh
zplug "plugins/python",            from:oh-my-zsh
zplug "plugins/systemadmin",       from:oh-my-zsh
zplug "plugins/sytemd",            from:oh-my-zsh
zplug "plugins/tmux",              from:oh-my-zsh

# Load local plugins
zplug "${HOME}/.zsh/aliases.zsh",                 from:local
zplug "${HOME}/.zsh/export.zsh",                  from:local
zplug "${HOME}/.zsh/functions.zsh",               from:local
zplug "${HOME}/.zsh/zsh-syntax-highlighting.zsh", from:local

# Load zsh-users plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"  defer:2
zplug "zsh-users/history-substring-search" defer:3

# Load other plugins
zplug "MichaelAquilina/zsh-you-should-use"

# Load theme
zplug "dracula/zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
zplug load --verbose

# Set starship as shell prompt
eval "$(starship init bash)"

# Show system info
macchina