#Personal Aliases

source ~/dotfiles/local_aliases.zsh
alias md="mkdir"
alias bk="cd .."
alias py3="python3"
alias edz="vim ~/.zshrc"
alias eda="vim ~/.aliases.zsh"
alias djrs="python manage.py runserver 8888"
alias scz="source ~/.zshrc"
alias edvim="vim ~/.vim/vimrc"
alias pry="pry --simple-prompt"
alias rs="rails s -p 8888"
alias gemdir="gem env gemdir"
alias x="exit"
alias gpp="g++"
alias j="jump"
mcd() {
    mkdir -p "$1" && cd "$1"
}
alias tmux_rename_window='tmux rename-window $(basename $(pwd))'
alias plz='sudo $(fc -ln -1)'
# Show Colors
alias showcolors='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias ....="cd ../../.."

alias l="ls -lh"
m () {
    make f=$1
}
mc () {
    make clean f=$1
}

