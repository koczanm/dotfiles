#!/usr/bin/env bash

echo "Installing tmux-256color"

curl -fsSL https://invisible-island.net/datafiles/current/terminfo.src.gz | gzip -d >/tmp/terminfo.src
tic -xe tmux-256color /tmp/terminfo.src
