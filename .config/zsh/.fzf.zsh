# Setup fzf
# ---------
# NOTE handled by ~/.zshenv
# if [[ ! "$PATH" == */home/pdiercks/.config/nvim/plugged/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/home/pdiercks/.config/nvim/plugged/fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pdiercks/.config/nvim/plugged/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/pdiercks/.config/nvim/plugged/fzf/shell/key-bindings.zsh"

# Default command
# ---------------
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*'"
