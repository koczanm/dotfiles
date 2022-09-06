#!/usr/bin/env bash

ASDF_PLUGINS=(
	nodejs
	python
	ruby
)

mapfile -t installed_plugins < <(asdf plugin list)

echo "Installing asdf plugins..."

for plugin in "${ASDF_PLUGINS[@]}"; do
	if [[ " ${installed_plugins[*]} " =~ ${plugin} ]]; then
		asdf plugin update "${plugin}"
	else
		asdf plugin install "${plugin}"
	fi

done
