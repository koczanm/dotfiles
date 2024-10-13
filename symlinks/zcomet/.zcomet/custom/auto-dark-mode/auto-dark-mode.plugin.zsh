function get_system_mode() {
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
    echo "dark"
  else
    echo "light"
  fi
}

function set_dark_mode() {
  # Update env variables
  export BAT_THEME="Catppuccin Frappe"
  export LS_COLORS=$(vivid generate catppuccin-frappe)
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
    --color=selected-bg:#51576d \
    --multi"
  export LG_CONFIG_FILE="${XDG_CONFIG_HOME}/lazygit/config.yml,${XDG_CONFIG_HOME}/lazygit/catppuccin-frappe.yml"
  fast-theme -q XDG:catppuccin-frappe

  # Update the symlinks to point to configurations with the dark theme
  ln -sf ${XDG_CONFIG_HOME}/btop/themes/catppuccin_frappe.theme ${XDG_CONFIG_HOME}/btop/themes/catppuccin.theme
  ln -sf ${XDG_CONFIG_HOME}/lsd/catppuccin_frappe.yaml ${XDG_CONFIG_HOME}/lsd/colors.yaml
  ln -sf ${XDG_CONFIG_HOME}/macchina/themes/catppuccin_frappe.toml ${XDG_CONFIG_HOME}/macchina/themes/catppuccin.toml

  # Set list-colors to enable filename colorizing
  zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}

  # Update ZSH modules that depend on env variables
  zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
  zstyle ":fzf-tab:*" fzf-flags ${(z)FZF_DEFAULT_OPTS}
}

function set_light_mode() {
  # Update env variables
  export BAT_THEME="Catppuccin Latte"
  export LS_COLORS=$(vivid generate catppuccin-latte)
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
    --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
    --color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
    --color=selected-bg:#bcc0cc \
    --multi"
  export LG_CONFIG_FILE="${XDG_CONFIG_HOME}/lazygit/config.yml,${XDG_CONFIG_HOME}/lazygit/catppuccin-latte.yml"
  fast-theme -q XDG:catppuccin-latte

  # Update the symlinks to point to configurations with the light theme
  ln -sf ${XDG_CONFIG_HOME}/btop/themes/catppuccin_latte.theme ${XDG_CONFIG_HOME}/btop/themes/catppuccin.theme
  ln -sf ${XDG_CONFIG_HOME}/lsd/catppuccin_latte.yaml ${XDG_CONFIG_HOME}/lsd/colors.yaml
  ln -sf ${XDG_CONFIG_HOME}/macchina/themes/catppuccin_latte.toml ${XDG_CONFIG_HOME}/macchina/themes/catppuccin.toml

  # Update ZSH modules that depend on env variables
  zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
  zstyle ":fzf-tab:*" fzf-flags ${(z)FZF_DEFAULT_OPTS}
}

function toggle_mode_precmd() {
  if [[ "$(get_system_mode)" == "dark" ]]; then
    set_dark_mode
  else
    set_light_mode
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd toggle_mode_precmd
