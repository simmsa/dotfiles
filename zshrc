# Antigen controls oh my zsh, including themes and plugins
source ~/dotfiles/antigenrc.zsh

export PATH="$PATH:/usr/local/heroku/bin:/opt/X11/bin:"

export PATH="$PATH:/Users/macuser/dotfiles/bin:"

export EDITOR='/usr/local/bin/nvim'

# Source my Aliases
source ~/dotfiles/aliases.zsh

#Terminal Colors
export CLICOLOR=1;

#Python virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Add timelapse scripts
export PATH="$PATH:/Users/macuser/Desktop/Programming/ruby/make_timelapse_preview"

# ZSH in vim command line
export ZDOTDIR=$HOME

export PYTHONSTARTUP="/Users/macuser/.pyrc"

# Set bash to vi mode
set -o vi
# Faster key timeout
export KEYTIMEOUT=3

# Change esc to jk in vi mode
bindkey -M vicmd "h" down-line-or-history
bindkey -M vicmd "t" up-line-or-history
bindkey -M vicmd "n" vi-forward-char
bindkey -M vicmd "d" vi-backward-char
bindkey -M vicmd "K" vi-kill-eol
bindkey -M vicmd "j" vi-find-next-char-skip
bindkey -M menuselect "^h" vi-down-line-or-history
bindkey -M menuselect "^t" vi-up-line-or-history
bindkey '^N' history-beginning-search-forward
bindkey '^T' history-beginning-search-backward
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^B' backward-char
bindkey '^a' beginning-of-line
# Don't have to press enter twice out of autocomplete
bindkey -M menuselect '^M' .accept-line

# Tmux tabs can be renamed
DISABLE_AUTO_TITLE=true

# More extensive tab completion
autoload -U compinit
compinit
# Tab completion from both ends
setopt completeinword
# Tab completion should be case-insensitive and fuzzy
zstyle ':completion:*' matcher-list '' \
'm:{a-zA-z}={A-Za-z}' \
'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

# Redraw the current dir, truncated to the first 8 characters
precmd() {
    CURRENT_DIR=$(basename $(pwd))
    DIR_LEN=${#CURRENT_DIR}
    if [ $DIR_LEN -gt 8 ]
    then
        # Print the first four characters..last four characters
        printf '\033k%.4s…%s\033\\' $CURRENT_DIR $(echo ${CURRENT_DIR:(-4)})
    else
        printf '\033k%s\033\\' $CURRENT_DIR
    fi
}

# Redraw the current dir, truncated to the first 8 characters
preexec() {
    EXECUTING_COMMAND=$(print -Pn '$1:q' | sed 's/\\//g')
    COMMAND_LEN=${#EXECUTING_COMMAND}
    if [ $COMMAND_LEN -gt 8 ]
    then
        printf '\033k%.4s…%s\033\\' $EXECUTING_COMMAND $(echo ${EXECUTING_COMMAND:(-4)})
    else
        printf '\033k%s\033\\' $EXECUTING_COMMAND
    fi
}

if [[ "$(uname)" == "Darwin" ]]; then
    # Start tmux when terminal starts
    if command -v tmux>/dev/null; then
          [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
    fi

     # Java Stuff
    export CLASSPATH=$CLASSPATH:~/algs4/stdlib.jar:~/algs4/algs4.jar

    # Android Stuff
    export PATH=$PATH:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools

    # Gtk+ Stuff
    export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

    # Latex Setup
    eval `/usr/libexec/path_helper -s`

    archey -c

elif [[ "$(uname)" == "Linux" && "$(whoami)" == "vagrant" ]]; then
    # Vagrant machine setup
    export TERM=screen-256color

    # Linuxbrew
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

    screenfetch
fi

