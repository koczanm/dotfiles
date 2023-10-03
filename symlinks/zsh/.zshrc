#---------------------------------- Env vars -----------------------------------

# Use light or dark theme
if defaults read -g AppleInterfaceStyle &> /dev/null; then
  export DARK_THEME=true
else
  export DARK_THEME=false
fi

# Add Homebrew packages to PATH
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/homebrew/sbin:${PATH}"

# Add local binaries to PATH
export PATH="${HOME}/.local/bin:${PATH}"

# Add cargo binaries to PATH
export PATH="${HOME}/.cargo/bin:${PATH}"

# Save Homebrew's install location
BREW_PREFIX=$(brew --prefix)

# Overwrite built-in GNU utils
export PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"
export PATH="${BREW_PREFIX}/opt/findutils/libexec/gnubin:${PATH}"
export PATH="${BREW_PREFIX}/opt/grep/libexec/gnubin:${PATH}"
export PATH="${BREW_PREFIX}/opt/gnu-indent/libexec/gnubin:${PATH}"
export PATH="${BREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${PATH}"
export PATH="${BREW_PREFIX}/opt/gnu-tar/libexec/gnubin:${PATH}"
export PATH="${BREW_PREFIX}/opt/gnu-which/libexec/gnubin:${PATH}"

# Make neovim the default editor
export EDITOR="nvim"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr
export PYTHONIOENCODING="UTF-8"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Apply catppuccin color scheme for `bat`
if [ "$DARK_THEME" = true ]; then
  export BAT_THEME="Catppuccin-frappe"
else
  export BAT_THEME="Catppuccin-latte"
fi

# Avoid issues with `gpg` as installed via Homebrew
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# Set colors for `jq`
export JQ_COLORS='0;31:0;39:0;39:0;39:0;32:1;39:1;39'

# Generate LS_COLORS
if [ "$DARK_THEME" = true ]; then
  export LS_COLORS=$(vivid generate catppuccin-frappe)
else
  export LS_COLORS=$(vivid generate catppuccin-latte)
fi

# Use `fd` for a faster alternative to `find`
if [ "$DARK_THEME" = true ]; then
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
else
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
    --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
    --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
fi
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"]
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# Automatically start TMUX
export ZSH_TMUX_AUTOSTART_ONCE=1
export ZSH_TMUX_FIXTERM_WITHOUT_256COLOR="tmux"
export ZSH_TMUX_FIXTERM_WITH_256COLOR="tmux-256color"

# Prevent Homebrew from reporting
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Fix unreadable pre-commit messages
export PRE_COMMIT_COLOR="never"

# Change the default config directory
export XDG_CONFIG_HOME="${HOME}/.config"

# Change the default cache directory for ZSH
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

#----------------------------------- Zcomet ------------------------------------

# Clone zcomet if necessary
if [[ ! -f "${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh" ]]; then
  command git clone https://github.com/agkozak/zcomet.git "${ZDOTDIR:-${HOME}}/.zcomet/bin"
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load oh-my-zsh plugins
zcomet load ohmyzsh lib compfix.zsh
zcomet load ohmyzsh lib completion.zsh
zcomet load ohmyzsh lib correction.zsh
zcomet load ohmyzsh lib git.zsh
zcomet load ohmyzsh lib history.zsh
zcomet load ohmyzsh plugins/asdf
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/docker-compose
zcomet load ohmyzsh plugins/fzf
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/python
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/tmux

# Lazy load some oh-my-zsh plugins
zcomet trigger extract x ohmyzsh plugins/extract

# Load zsh-users plugins
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions

# Load other plugins
zcomet load MichaelAquilina/zsh-you-should-use
zcomet load Aloxaf/fzf-tab

# Load theme
zcomet load zsh-users/zsh-history-substring-search
zcomet load zdharma-continuum/fast-syntax-highlighting

# Include custom zsh-completions
fpath+=("${ZSH_CACHE_DIR}/completions")

# Run compinit and compile its cache
zcomet compinit


#----------------------------------- Configs -----------------------------------

# Enable Emacs keybindings
bindkey -e

# disable sort when completing `git checkout`
zstyle ":completion:*:git-checkout:*" sort false

# set descriptions format to enable group support
zstyle ":completion:*:descriptions" format '[%d]'

# set list-colors to enable filename colorizing
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ":fzf-tab:complete:cd:*" fzf-preview 'lsd -1 --color=always $realpath'

# switch group using `,` and `.`
zstyle ":fzf-tab:*" switch-group "," "."

# Set colors for fast-syntax-highlighting
if [ "$DARK_THEME" = true ]; then
  fast-theme -q XDG:catppuccin-frappe
else
  fast-theme XDG:catppuccin-latte
fi

#---------------------------------- Functions ----------------------------------

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

#----------------------------------- Aliases -----------------------------------

# NAVIGATION
alias ..="cd ../"
alias ...="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"

# SHORTCUTS
alias cdev="cd ~/Developer"
alias cdoc="cd ~/Documents"
alias cdl="cd ~/Downloads"
alias cdt="cd ~/Desktop"

# LISTING
alias ls="lsd"
alias ll="lsd -l"
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

# FILE HANDLING
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias zshrc="${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc"
alias dud='du -d 1 -h'
alias duf='du -sh *'

# GREP
alias grep="grep --color"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} "

# FILES
alias cat="bat"
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

# VIM
if [ "$DARK_THEME" = true ]; then
  alias lg="lazygit --use-config-file=\"${XDG_CONFIG_HOME}/lazygit/config.yml,${XDG_CONFIG_HOME}/lazygit/catppuccin-frappe.yml\""
else
  alias lg="lazygit --use-config-file=\"${XDG_CONFIG_HOME}/lazygit/config.yml,${XDG_CONFIG_HOME}/lazygit/catppuccin-latte.yml\""
fi
alias vim="nvim"

#---------------------------------- Symlinks -----------------------------------

if [ "$DARK_THEME" = true ]; then
 ln -sf ${XDG_CONFIG_HOME}/btop/themes/catppuccin_frappe.theme ${XDG_CONFIG_HOME}/btop/themes/catppuccin.theme
 ln -sf ${XDG_CONFIG_HOME}/lsd/catppuccin_frappe.yaml ${XDG_CONFIG_HOME}/lsd/colors.yaml
 ln -sf ${XDG_CONFIG_HOME}/macchina/themes/catppuccin_frappe.toml ${XDG_CONFIG_HOME}/macchina/themes/catppuccin.toml
else
 ln -sf ${XDG_CONFIG_HOME}/btop/themes/catppuccin_latte.theme ${XDG_CONFIG_HOME}/btop/themes/catppuccin.theme
 ln -sf ${XDG_CONFIG_HOME}/lsd/catppuccin_latte.yaml ${XDG_CONFIG_HOME}/lsd/colors.yaml
 ln -sf ${XDG_CONFIG_HOME}/macchina/themes/catppuccin_latte.toml ${XDG_CONFIG_HOME}/macchina/themes/catppuccin.toml
fi

#------------------------------------ Extra ------------------------------------

# if [[ -f ~/.zsh_extra ]]; then
#   source ~/.zsh_extra
# fi

#----------------------------------- Prompt ------------------------------------

# Set starship as shell prompt
eval "$(starship init zsh)"

# Show system info at the startup
macchina

