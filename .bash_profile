export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Use Neovim by default
if ! type "nvim" &> /dev/null; then
  echo "Neovim not installed. Using regular VIM. Configuration propably messed up."
else
  alias vim='nvim'
fi

# Fancier git diff. Requires diff-so-fancy from NPM
if ! type "diff-so-fancy" &> /dev/null; then
  echo "diff-so-fancy not installed from NPM. gdiff alias not available."
else
  alias gdiff='git diff | diff-so-fancy'
fi

# Alias CTAGS if installed from brew
if [ -f /usr/local/bin/ctags ]; then
  alias ctags="/usr/local/bin/ctags"
fi

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"

alias tmux="TERM=screen-256color-bce tmux"

# Setup git tab completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Show git branch in prompt
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='\[\033[0;32m\]\u@\h\[\033[01;34m\] \W\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
else
  echo "Missing ~/.git-prompt.sh. Unable to show correct prompt."
fi

# Share bash history between sessions and for example tmux
shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'
PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND"

# Azure CLI auto complete and path
export PATH=$PATH:/Users/jarno/bin
source '/Users/jarno/lib/azure-cli/az.completion'

# NVM for Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
