# Local Aliases

# These file contains aliases specific to the different systems I use.

if [[ "$(uname)" == "Darwin" && "$(hostname)" == "as_macbook" ]]; then

alias chrome="open /Applications/Google\ Chrome.app"
alias chruby="vim ~/Desktop/Programming/ruby/rubycheatsheet.md"
alias color="open /Applications/Utilities/DigitalColor\ Meter.app"
alias edcss="vim ~/Desktop/Programming/markdown/md_components/bootstrap/sass/_custom.scss"
alias f="fzf"
alias fixsound="sudo killall coreaudiod"
alias goog="google"
alias ipy='ipython qtconsole --stylesheet="~/Desktop/Programming/python/ipython/stylesheet/ipy_stylesheet.css" --ConsoleWidget.font_family="Fira Mono" --ConsoleWidget.font_size=24 --matplotlib inline --pylab --style=monokai'
alias markdown-pp="~/Desktop/Programming/python/markdown-pp/markdown-pp.py"
alias myvim="/Users/macuser/Desktop/Programming/neovim/build/bin/nvim"
alias objcopy="gobjcopy"
alias objdump="gobjdump"
alias org-mode='vim -c "call OrgAgenda()"'
alias pgstart="postgres -D /usr/local/var/postgres"
alias tipc="vim ~/Desktop/Programming/C/c_tips.md"
alias tipgit="vim ~/Desktop/Programming/git/git-tips.md"
alias tiprails="vim ~/Desktop/Programming/ruby/rails/railscheatsheet.md"
alias tipruby="vim ~/Desktop/Programming/ruby/rubytips.md"
alias tipvim="vim ~/Desktop/Programming/vim/vim_cheatsheet.md"
alias tmux_rename_window='tmux rename-window $(basename $(pwd))'
alias va="vagrant"

#Reload Chrome on command
chrome_reload () {
    osascript -e 'tell application "Google Chrome"' -e 'tell the active tab of its first window' -e 'reload' -e 'end tell' -e 'end tell'
}

# Writing
entry () {
    DATE=$(date "+%Y_%m_%d")

    if [ ! -f $DATE.md ]
    then
        touch $DATE.md
    fi

    vim $DATE.md
}

# fzf copy file path to system clipboard (used for images mostly)
fcpath() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        "$(pwd)/$file"
}

# fzf change directory, directly from fzf wiki
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fzf edit, directly from fzf wiki
fe() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && ${EDITOR:-nvim} "$file"
}
alias e=fe

# fh repeat history, directly from fzf wiki
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill kill process, directly from fzf wiki
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [[ "x$pid" != "x" ]]; then
        kill -${1:-9} $pid
    fi
}

# fzf open, edited from fzf wiki
fo() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && open "$file"
}

# fzf tmux pane
fpane() {
    local all_panes panes current_window current_pane prev_pane target target_window target_pane

    # Preserve whitespace for easier grepping
    set IFS='%'
    all_panes=$(tmux list-panes -s -F '#I:#P - #W - #{pane_current_path} -  #{pane_current_command}')
    unset IFS
    current_window=$(tmux display-message  -p '#I')
    current_pane=$(tmux display-message -p '#P')
    prev_pane=$(($current_pane - 1))

    # Remove the calling pane and the previous pane before fzfing
    panes=$(echo "$all_panes" | grep -v $current_window:$current_pane | grep -v $current_window:$prev_pane)

    target=$(echo "$panes" | fzf) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)


    if [[ $current_window -eq $target_window ]]; then
        tmux select-pane -t ${target_window}.${target_pane}
    else
        tmux select-pane -t ${target_window}.${target_pane} &&
        tmux select-window -t $target_window
    fi

    # Kill the created pane
    tmux kill-pane $current_window.$this_pane

}

md2pdf() {
    echo "Compiling $1.md into $1.pdf..."
    cp $1.md $1.mdpp && \
    markdown-pp $1.mdpp $1_comp.md && \
    md2html $1_comp.md > $1.html && \
    wkhtmltopdf --page-size Letter --javascript-delay 25000 $1.html $1.pdf && \
    open $1.pdf
    rm $1.mdpp && \
    rm $1_comp.md
}

# Create notes file and open in vim
note () {
    DIR=${PWD##*/}
    FILENAME="$(echo $DIR)_notes.md"
    if [ ! -f $FILENAME ]
    then
        touch $FILENAME
    fi

    vim $FILENAME

}
alias notes="note"

# Quit application on command
quit () {
  for app in $*; do
    osascript -e 'quit app "'$app'"';
  done
}

fi
