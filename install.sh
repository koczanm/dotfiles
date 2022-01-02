#!/usr/bin/env bash

# Create dotfiles directory
mkdir -p "${HOME}/.dotfiles/"

# Download tarball
curl -fsSL https://github.com/koczanm/dotfiles/tarball/main | tar -xzv --strip-components=1 -C "${HOME}/.dotfiles"

# Run bootstrap scripts
${HOME}/.dotfiles/bin/bootstrap-apps
${HOME}/.dotfiles/bin/bootstrap-dotfiles
${HOME}/.dotfiles/bin/bootstrap-macos