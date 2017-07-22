export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export NVM_DIR="/Users/jarno/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

alias dm='docker-machine'
alias dmenv='dm env default && eval "$(dm env default)"'

alias vim='nvim'
# tic ~/.$TERM.ti

alias gdiff='git diff | diff-so-fancy'

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

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source ~/.git-prompt.sh

export PS1='\[\033[0;32m\]\u@\h\[\033[01;34m\] \W\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Share bash history between sessions and for example tmux
shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'
PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND"

# Azure CLI
export PATH=$PATH:/Users/jarno/bin
source '/Users/jarno/lib/azure-cli/az.completion'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
