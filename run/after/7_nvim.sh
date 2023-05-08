#!/usr/bin/env bash

echo "Setting up NvChad..."

git clone https://github.com/NvChad/NvChad "${HOME}/.config/nvim" --depth 1 && nvim
