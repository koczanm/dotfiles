#!/usr/bin/env bash

DOTFILES_DIR = "${HOME}/.dotfiles/"

# Create dotfiles directory
mkdir -p ${DOTFILES_DIR}

# Download tarball
curl -fsSL https://github.com/koczanm/dotfiles/tarball/main | tar -xzv --strip-components=1 -C ${DOTFILES_DIR}

# Run bootstrap scripts
${DOTFILES_DIR}/zero/setup
