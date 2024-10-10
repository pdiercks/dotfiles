typeset -U path PATH

# set variables for IMF (fcitx5)
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export SDL_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
# enable support of IME in kitty
export GLFW_IM_MODULE="ibus"

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export WM="awesome"

path=("/bin" "/usr/bin" "/usr/local/bin" "$HOME/bin" "$HOME/.local/bin" "$HOME/.local/share")
export PATH
