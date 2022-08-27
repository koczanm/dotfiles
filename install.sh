#!/usr/bin/env bash

DOTFILES_DIR="${HOME}/.dotfiles"

# Create dotfiles directory
mkdir -p "${DOTFILES_DIR}"

# Download dotfiles
curl -fsSL https://github.com/koczanm/dotfiles/tarball/main | tar -xzv --strip-components=1 -C "${DOTFILES_DIR}"

# Download zero.sh
curl -fsSL https://github.com/zero-sh/zero.sh/tarball/master | tar -xzv --strip-components=1 -C "${DOTFILES_DIR}/zero"

# Run bootstrap scripts
${DOTFILES_DIR}/zero/setup
