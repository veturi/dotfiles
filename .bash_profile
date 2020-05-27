export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Use Neovim by default. Fallback to vim
if ! type "nvim" &> /dev/null; then
  export VISUAL=vim
  echo "Neovim not installed. Using regular VIM. Configuration propably messed up."
else
  alias vim='nvim'
  export VISUAL=nvim
fi

export EDITOR="$VISUAL"

# Alias CTAGS if installed from brew
if [ -f /usr/local/bin/ctags ]; then
  alias ctags="/usr/local/bin/ctags"
fi

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

alias tmux="TERM=screen-256color-bce tmux"

# Setup git tab completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Setup tmux bash completion
if [ -f ~/.tmux-completion.bash ]; then
  . ~/.tmux-completion.bash
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
export HISTFILESIZE=10000
export HISTSIZE=10000
HISTCONTROL='ignoreboth'
PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND"

# NVM for Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=/usr/local/opt/python/bin:$PATH

export LC_ALL=fi_FI.UTF-8
alias excel='open -a Microsoft\ Excel'

### GO ###
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

### ZSH ###
# export ZDOTDIR=~/.dotfiles/.zsh/  # sets the ZSH configuration file location

