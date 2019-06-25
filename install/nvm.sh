#!/usr/bin/env bash

if ! is-executable brew -o ! is-executable git; then
  echo "Skipped nvm installation. Missing brew or git"
  return
fi

brew install nvm

