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

# Make less the default reader.
export MANPAGER="most"

# Avoid issues with `gpg` as installed via Homebrew
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# Use `fd`` for a faster alternative to `find`
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git --exclude .cache"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"

# Automatically start tmux
export ZSH_TMUX_AUTOSTART=true

# Prevent Homebrew from reporting
export HOMEBREW_NO_ANALYTICS=1