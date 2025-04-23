#!/usr/bin/env bash

if [[ $(uname -m) == "arm64" ]]; then
  echo "Installing Rosetta..."

  softwareupdate --install-rosetta
fi
