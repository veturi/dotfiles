#!/usr/bin/env bash

# install homebrew
if ! is-macos -o ! is-executable ruby -o ! is-executable curl ! is-executable git; then
  echo "Unable to install homebrew due to missing ruby, curl or git"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

apps=(
  bash-completion,
  elixir,
  neovim,
  tmux,
  wget,
  reattach-to-user-namespace
)

brew install "${apps[@]}"
