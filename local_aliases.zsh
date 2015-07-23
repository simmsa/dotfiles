# Local Aliases

# These file contains aliases specific to the different systems I use.

alias chrome="open /Applications/Google\ Chrome.app"
alias chruby="vim ~/Desktop/Programming/ruby/rubycheatsheet.md"
alias color="open /Applications/Utilities/DigitalColor\ Meter.app"
alias edcss="vim ~/Desktop/Programming/markdown/md_components/bootstrap/sass/_custom.scss"
alias fixsound="sudo killall coreaudiod"
alias goog="google"
alias gs="vim -c 'Gstatus | winc w | bd | exe \"normal \\<C-n>\"' ."
alias ipy='ipython qtconsole --stylesheet="~/Desktop/Programming/python/ipython/stylesheet/ipy_stylesheet.css" --ConsoleWidget.font_family="Fira Mono" --ConsoleWidget.font_size=24 --matplotlib inline --pylab --style=monokai'
alias less="less -k"
alias markdown-pp="~/Desktop/Programming/python/markdown-pp/markdown-pp.py"
alias myvim="/Users/macuser/Desktop/Programming/neovim/build/bin/nvim"
alias org-mode='vim -c "call OrgAgenda()"'
alias pgstart="postgres -D /usr/local/var/postgres"
alias py="/usr/local/bin/python"
alias tipc="vim ~/Desktop/Programming/C/c_tips.md"
alias tipgit="vim ~/Desktop/Programming/git/git-tips.md"
alias tiprails="vim ~/Desktop/Programming/ruby/rails/railscheatsheet.md"
alias tipruby="vim ~/Desktop/Programming/ruby/rubytips.md"
alias tipvim="vim ~/Desktop/Programming/vim/vim_cheatsheet.md"
alias va="vagrant"
alias vimdb="vim -V20vimlog"

# Reload Chrome on command
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
