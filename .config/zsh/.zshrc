autoload -U colors && colors

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters

# aliases
[ -f ~/.config/zsh/aliases/aliases.zsh ] && source ~/.config/zsh/aliases/aliases.zsh

# auto suggestions
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting, should be sourced at the end!
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
