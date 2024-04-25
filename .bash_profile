export EDITOR='nvim'
export VISUAL='nvim'

export XDG_CONFIG_HOME=$HOME/.config/
export XDG_CACHE_HOME=$HOME/.cache/
export XDG_DATA_HOME=$HOME/.local/share/
export XDG_STATE_HOME=$HOME/.local/state/
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg/
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
export CARGO_HOME=$HOME/.local/share/cargo/
export RUSTUP_HOME=$HOME/.local/share/rustup/

. "$HOME/.local/share/cargo/env"

alias x="dbus-run-session Hyprland"
