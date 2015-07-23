# Old habits die hard
if type "nvim" > /dev/null; then
    export NVIM_TUI_ENABLE_TRUE_COLOR=1
    alias vim="nvim"
    alias vi="nvim"
fi

alias goog="google"
alias va="vagrant"
alias chrome="open /Applications/Google\ Chrome.app"
alias mamp="open /Applications/MAMP/MAMP.app"
alias codekit="open /Applications/CodeKit.app"
alias color="open /Applications/Utilities/DigitalColor\ Meter.app"
# Cheatsheets
alias tipvim="vim ~/Desktop/Programming/vim/vim_cheatsheet.md"
alias chruby="vim ~/Desktop/Programming/ruby/rubycheatsheet.md"
alias chrails="vim ~/Desktop/Programming/ruby/rails/railscheatsheet.md"
alias tipruby="vim ~/Desktop/Programming/ruby/rubytips.md"
alias tipc="vim ~/Desktop/Programming/C/c_tips.md"
alias tipgit="vim ~/Desktop/Programming/git/git-tips.md"

alias less="less -k"

alias pgstart="postgres -D /usr/local/var/postgres"
alias py="/usr/local/bin/python"
alias ipy='ipython qtconsole --stylesheet="~/Desktop/Programming/python/ipython/stylesheet/ipy_stylesheet.css" --ConsoleWidget.font_family="Fira Mono" --ConsoleWidget.font_size=24 --matplotlib inline --pylab --style=monokai'

# Hacky way to start vim with Gstatus open and jump to the first entry
alias gs="vim -c 'Gstatus | winc w | bd | exe \"normal \\<C-n>\"' ."

alias org-mode='vim -c "call OrgAgenda()"'
alias fixsound="sudo killall coreaudiod"
alias markdown-pp="~/Desktop/Programming/python/markdown-pp/markdown-pp.py"
alias edcss="vim ~/Desktop/Programming/markdown/md_components/bootstrap/sass/_custom.scs"
alias get_makefile="cp ~/Desktop/Programming/C/Makefile ."
alias myvim="/Users/macuser/Desktop/Programming/neovim/build/bin/nvim"
# Log what vim is doing to find the cause of errors and segfaults
alias vimdb="vim -V20vimlog"

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
#Reload Chrome on command
chrome_reload () {
    osascript -e 'tell application "Google Chrome"' -e 'tell the active tab of its first window' -e 'reload' -e 'end tell' -e 'end tell'
}
# Quit application on command
quit () {
  for app in $*; do
    osascript -e 'quit app "'$app'"';
  done
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
