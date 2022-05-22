neofetch --ascii_distro Xubuntu

# History in cache directory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/zsh_history

# add folder with completion scripts
fpath=(~/.config/zsh/tabcompletion $fpath)

# Use modern completion system
autoload -Uz compinit && compinit
# Enable colors
autoload -U colors && colors

zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

export VISUAL=nvim

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
# go up/down searching through the history with what you have typed so far
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-beginning-search
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-beginning-search

# define aliases
source ~/.config/zsh/aliases/aliases.zsh

# spaceship prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_USER_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=true
SPACESHIP_CONDA_COLOR=blue
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

# plugins
source ~/.config/zsh/plugins/web-search.plugin.zsh
source ~/.config/zsh/plugins/completion.zsh # oh my zsh completion

# TODO move this to .zshenv?
# export texlive path
PATH=$HOME/texlive/2021/bin/x86_64-linux:$PATH
MANPATH=$HOME/texlive/2021/texmf-dist/doc/man:$MANPATH
INFOPATH=$HOME/texlive/2021/texmf-dist/doc/info:$INFOPATH
# bam tex beamer
export TEXINPUTS=$HOME/repos/bam/bam-tex-beamer:$TEXINPUTS

# make fzf available
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

# open the current command line in a text editor 
# by pressing <C-x><C-e>
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Nested instances of Neovim
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
	# prevent yourself from starting nested instances
	alias nvim='echo "No nesting!"'
	# make prompt look different
	SPACESHIP_CHAR_SYMBOL="❯❯"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pdiercks/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pdiercks/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pdiercks/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pdiercks/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
