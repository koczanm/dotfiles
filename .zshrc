# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load oh-my-zsh plugins
zcomet load ohmyzsh lib/clipboard
zcomet load ohmyzsh lib/completion
zcomet load ohmyzsh lib/history

# Lazy-load oh
zcomet load ohmyzsh plugins/brew
zcomet load ohmyzsh plugins/colored-man-pages
zcomet load ohmyzsh plugins/colorize 
zcomet load ohmyzsh plugins/common-aliases
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/docker-compose
zcomet load ohmyzsh plugins/fzf
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/kubectl
zcomet load ohmyzsh plugins/macos
zcomet load ohmyzsh plugins/pipenv
zcomet load ohmyzsh plugins/python
zcomet load ohmyzsh plugins/systemadmin
zcomet load ohmyzsh plugins/systemd
zcomet load ohmyzsh plugins/tmux

# Load local plugins
zcomet load ${HOME}/.zsh/aliases.zsh
zcomet load ${HOME}/.zsh/exports.zsh
zcomet load ${HOME}/.zsh/functions.zsh
zcomet load ${HOME}/.zsh/zsh-syntax-highlighting.zsh

# Load zsh-users plugins
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-history-substring-search

# Load other plugins
zcomet load MichaelAquilina/zsh-you-should-use

# Load theme
zcomet load dracula/zsh

# Run compinit and compile its cache
zcomet compinit

# Set starship as shell prompt
eval "$(starship init zsh)"

# Show system info at the startup
macchina
