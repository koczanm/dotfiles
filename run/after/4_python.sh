#!/usr/bin/env bash

PYTHON_PACKAGES=(
	poetry
)

echo "Installing global Python tools..."

pipx install "${PYTHON_PACKAGES[@]}"
