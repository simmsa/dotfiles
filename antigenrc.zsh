source ~/dotfiles/antigen/antigen.zsh

# Oh My Zsh & plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle vi-mode
antigen bundle jump
antigen bundle web-search
antigen bundle history-substring-search

# Themes
antigen theme simmsa/dotfiles themes/custom_agnoster

antigen apply
