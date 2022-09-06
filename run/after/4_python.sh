#!/usr/bin/env bash

PYTHON_PACKAGES=(
  autoflake
  black
  cruft
  isort
	poetry
  pre-commit
)

echo "Installing global Python tools..."

pipx install "${PYTHON_PACKAGES[@]}"
