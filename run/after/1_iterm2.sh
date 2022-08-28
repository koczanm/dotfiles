#!/usr/bin/env bash

echo "Copying iTerm2 profile..."

mkdir -p "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/"
cp "${HOME}/.dotfiles/run/assets/Profiles.json" "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/Profiles.json"
