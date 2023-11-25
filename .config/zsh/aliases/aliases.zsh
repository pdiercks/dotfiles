# basic
alias ls='ls --color --group-directories-first'
alias ll='ls -lh'
alias ..="cd .."

# alias to manage dotfiles with git
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# source zsh
alias szsh="source ~/.config/zsh/.zshrc"

# easy access to dotfiles
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias zshalias="nvim ~/.config/zsh/aliases/aliases.zsh"
alias wmrc="nvim ~/.config/awesome/rc.lua"

# conda
# make it a function
ca () {
	conda activate "$(conda info --envs | fzf | awk '{print $1}')"
}
alias cde="conda deactivate"

# todo.txt
# alias t="todo.sh"

# git
alias ga="git add"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gst="git status"
alias gd="git diff"
gam () {
    # send list of modified files to fzf for multiple selection
    # and git add selected files
    selected="$(git ls-files -m | sort | fzf -e -i -m --delimiter / --with-nth -1)"
    if [ ! -z "$selected" ] 
    then
        echo "$selected" | while read -r line; do
            git add $line
        done 
    fi
}
gaun () {
    # send list of untracked files to fzf for multiple selection
    # and git add selected files
    selected="$(git ls-files --others --exclude-standard | sort | fzf -e -i -m --delimiter / --with-nth -1)"
    if [ ! -z "$selected" ] 
    then
        echo "$selected" | while read -r line; do
            git add $line
        done 
    fi
}
