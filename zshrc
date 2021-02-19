#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export EDITOR=vim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
# Give maven more memory
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"


# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }


# Aliases
#alias cat='bat'
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"


# change iterm profile
function switchItermProfileLight {
  echo -e "\033]50;SetProfile=zsh\a"
}
function switchItermProfileDark {
  echo -e "\033]50;SetProfile=Dark\a"
}
function nightMode {
    val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [[ $val == "Dark" ]]; then
        switchItermProfileDark
    fi
}
#nightMode
