source ~/dotfiles/zgen/zgen.zsh

if ! zgen saved; then

    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/jump
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/web-search
    zgen oh-my-zsh plugins/history-substring-search

    zgen load ~/dotfiles/themes/custom_agnoster

    zgen save
fi
