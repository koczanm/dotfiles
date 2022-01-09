# Save Homebrew's install location
BREW_PREFIX=$(brew --prefix)

# Add local binaries to PATH
export PATH="${HOME}/bin:${PATH}"

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

# Make bat the default reader.
export PAGER="bat --theme Dracula"

# Avoid issues with `gpg` as installed via Homebrew
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# Set colors for `jq`
export JQ_COLORS='0;31:0;39:0;39:0;39:0;32:1;39:1;39'

# Use `fd`` for a faster alternative to `find`
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git']
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# Fix disappearing cursor in dracula/zsh-syntax-highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

# Automatically start TMUX
export ZSH_TMUX_AUTOSTART=1

# Prevent Homebrew from reporting
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1