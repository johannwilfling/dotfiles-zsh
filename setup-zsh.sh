#!/bin/zsh

# TODO:
# - Set login command "zsh --login" within iTerm Profile to read .zlogin at startup

# Clone the repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Link the files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Overwrite with customizations
cp zshrc "${ZDOTDIR:-$HOME}/.zshrc"
cp zprestorc "${ZDOTDIR:-$HOME}/.zprestorc"

# Set default shell
chsh -s /bin/zsh

