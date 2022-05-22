typeset -U PATH path

# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export ZDOTDIR=$HOME/.config/zsh

# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export OPENER="xdg-open"
export WM="awesome"

# Path
path=("/bin" "usr/bin" "/usr/games" "/usr/local/bin" "$HOME/bin" "$HOME/.local/bin" "$HOME/.local/share" "$HOME/.config/nvim/plugged/fzf/bin" "/snap/bin")
export PATH
