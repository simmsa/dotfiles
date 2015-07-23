# Common Aliases

# This file contains aliases I want on all systems I use.

# Use neovim with true color if it is available
if type "nvim" > /dev/null; then
    export NVIM_TUI_ENABLE_TRUE_COLOR=1
    alias vim="nvim"
    alias vi="nvim"
fi

source ~/dotfiles/local_aliases.zsh

alias ....="cd ../../.."
alias bk="cd .."
alias djrs="python manage.py runserver 8888"
alias eda="vim ~/dotfiles/aliases.zsh"
alias edla="vim ~/dotfiles/local_aliases.zsh"
alias edvim="vim ~/.nvim/nvimrc"
alias edz="vim ~/dotfiles/zshrc"
alias gemdir="gem env gemdir"
alias gpp="g++"
alias gs="vim -c 'Gstatus | winc w | bd | exe \"normal \\<C-n>\"' ."
alias j="jump"
alias l="ls -lh"
alias less="less -k"
alias md="mkdir -p"
alias plz='sudo $(fc -ln -1)'
alias pry="pry --simple-prompt"
alias py="python"
alias py3="python3"
alias rs="rails s -p 8888"
alias scz="source ~/.zshrc"
alias showcolors='for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 150 -s '"'"'  '"'"'; echo -e "\e[m"'
alias x="exit"
alias vimdb="vim -V20vimlog"

m () {
    make f=$1
}

mc () {
    make clean f=$1
}

mcd() {
    mkdir -p "$1" && cd "$1"
}

