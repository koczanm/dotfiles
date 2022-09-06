#!/usr/bin/env bash

echo "Updating Dock..."

dockutil --remove all --no-restart
dockutil --add "/System/Applications/Mail.app" --no-restart
dockutil --add "/Applications/Safari.app" --no-restart
dockutil --add "/Applications/Spotify.app" --no-restart
dockutil --add "/Applications/iTerm.app" --no-restart
dockutil --add "/System/Applications/System Preferences.app" --no-restart
dockutil --add "${HOME}/Desktop/Screenshots" --display stack  # Implicitly restarts the Dock
