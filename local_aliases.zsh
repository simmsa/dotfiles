# Old habits die hard
alias vim="nvim"
alias vi="nvim"

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

alias pgstart="postgres -D /usr/local/var/postgres"
alias py="/usr/local/bin/python"
alias ipy='ipython qtconsole --stylesheet="~/Desktop/Programming/python/ipython/stylesheet/ipy_stylesheet.css" --ConsoleWidget.font_family="Fira Mono" --ConsoleWidget.font_size=24 --matplotlib inline --pylab --style=monokai'

alias org-mode='vim -c "call OrgAgenda()"'
alias fixsound="sudo killall coreaudiod"
alias start_eclim="$ECLIPSE_HOME/eclimd"
alias stop_eclim="$ECLIPSE_HOME/eclim -command shutdown"
alias markdown-pp="~/Desktop/Programming/python/markdown-pp/markdown-pp.py"
alias edmdcss="vim ~/Desktop/Programming/markdown/md_components/Clearness-Fira.css"
export ECLIPSE_HOME="/opt/homebrew-cask/Caskroom/eclipse-java/4.4.0/eclipse"
md2pdf() {
    echo "Compiling $1.md into $1.pdf..."
    cp $1.md $1.mdpp && \
    markdown-pp $1.mdpp $1_comp.md && \
    md2html $1_comp.md > $1.html && \
    wkhtmltopdf --page-size Letter $1.html $1.pdf && \
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
