# Testing the type of system and setting up machine specific
# defaults
if [ "$(uname)" == "Linux" ]; then
    echo "Running on a Linux Machine."
    INSTALL="apt-get install"
    BREW_INSTALL="brew install"
    # To install software with apt this command needs to be run as sudo
    if [ "$(whoami)" != "root" ]; then
        echo "Please run this command as root."
        exit 1
    fi
elif [ "$(uname)" == "Darwin" ]; then
    echo "Running on an Apple Machine."
    INSTALL="brew install"
    BREW_INSTALL="brew install"
else
    echo "Error: Unknown machine type."
    exit 1
fi

install () {
    echo "Installing $1..."
    # $INSTALL $1
}

clone () {
    DIR="https://www.github.com/"
    CLONE="git clone"
    echo "Cloning $DIR$1..."
    # $CLONE $DIR$1
}

setup_dotfile () {
    DUMMY_FILE=$1
    SOURCE_FILE=$2
    if [ -f $1 ]; then
        echo "Appending dotfile $1..."
        echo $2 >> $1
    else
        echo "Creating dotfile $1..."
        touch $1
        echo $2 > $1
    fi
}

# Install Git
install git

# Clone my config files
clone simmsa/vimrc
clone simmsa/dotfiles

# Setup homebrew on Linux
if [ $(uname) == "Linux" ]; then
    echo "export PATH=\$HOME/.linuxbrew/bin:\$PATH" >> ~/dotfiles/zshrc
fi

# Install essential programs
$BREW_INSTALL vim --HEAD
setup_dotfile ~/test.zsh "source ~/dotfiles/test.zsh"

