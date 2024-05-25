autoload -U colors && colors

# add folder with completion scripts
fpath=(~/.config/zsh/tabcompletion $fpath)

autoload -Uz compinit promptinit
compinit
promptinit

prompt pure

# fzf key bindings and completion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# aliases
[ -f ~/.config/zsh/aliases/aliases.zsh ] && source ~/.config/zsh/aliases/aliases.zsh

# auto suggestions
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting, should be sourced at the end!
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# add texlive
PATH=$HOME/texlive/2024/bin/x86_64-linux:$PATH
MANPATH=$HOME/texlive/2024/texmf-dist/doc/man:$MANPATH
INFOPATH=$HOME/texlive/2024/texmf-dist/doc/info:$INFOPATH
