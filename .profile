export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export NVM_DIR="/Users/Jarno/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias dm='docker-machine'
alias dmenv='dm env default && eval "$(dm env default)"'
