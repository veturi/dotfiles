export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export NVM_DIR="/Users/jarno/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias dm='docker-machine'
alias dmenv='dm env default && eval "$(dm env default)"'

alias vim='nvim'
# tic ~/.$TERM.ti

# Retarded homebrew added opt-out google analytics. this disables it.
# On fresh systems also run this command after installation of brew:
# git config --file="$(brew --repository)/.git/config" --replace-all homebrew.analyticsdisabled true
# more info here: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

export VISUAL=vim
export EDITOR="$VISUAL"

alias tmux="TERM=screen-256color-bce tmux"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
