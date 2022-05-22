#!/usr/bin/env bash

# Create dotfiles directory
mkdir -p "${HOME}/.dotfiles/"

# Download tarball
curl -fsSL https://github.com/koczanm/dotfiles/tarball/main | tar -xzv --strip-components=1 -C "${HOME}/.dotfiles"

# Run bootstrap scripts
case "${OSTYPE}" in
    linux*) 
        ${HOME}/.dotfiles/bin/bootstrap-apps-linux
        ${HOME}/.dotfiles/bin/bootstrap-dotfiles
        ;;
    darwin*)
        ${HOME}/.dotfiles/bin/bootstrap-apps-macos
        ${HOME}/.dotfiles/bin/bootstrap-dotfiles
        ${HOME}/.dotfiles/bin/bootstrap-macos
        ;;
    *)
        echo "Unknown OS: ${OSTYPE}"
        exit 1
esac
