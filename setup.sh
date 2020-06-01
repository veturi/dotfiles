#!/usr/bin/env bash

# Create symlinks
# ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
# ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
# ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
# ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
# ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
apps=(
   "Magnet",
   "1Password",
   "Dropbox",
   "Docker",
   "Flux"
)

echo "${apps[@]}"

echo "Remember to install essentials from AppStore:"
echo " - Magnet"
echo " - 1password"
echo " - dropbox"
echo " - docker"
echo " - flux"

echo "to install python support for nvim install the following packages from brew. This is required by neodeplete"
echo "brew install python2"
echo "brew install python3"
echo "pip2 install neovim"
echo "pip3 install neovim"

echo "other brew packages to install:"
echo "lazydocker - (https://github.com/jesseduffield/lazydocker)"
