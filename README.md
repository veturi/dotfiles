# ZSH ENVIRONMENTS

TODO: Write script to do this. Documenting the process here from my new macbook

1. Install oh-my-zsh
2. Symlink .zshrc from dotfiles (oh-my-zsh creates a new one and backups your old)
3. Install homebrew
4. Install tmux & vim from homebrew
5. Symlink tmux config
6. Symlink nvim config
7. Symlink nvim init as vimrc config (for fallback)
8. Install iTerm and setup iTerm profile
9. Symlink global gitignore
10. Add FZF from homebrew
11. Enable FZF shell extensions from /usr/local/opt/fzf/install
12. Install AG from brew (for better FZF file ignore control)

# BASH ENVIRONMENTS

## document here

To get neovim configuration properly set up create a symlink from ~/.vim to ~/.config/nvim
Verify .vimrc is also symlinked to ~/.config/nvim/init.vim

when on OSX and using iTerm there is a bug with NeoVim and xterm256 terminfo sending wrong keycode
on ctrl+h combination (navigation between split screen panes). to fix this issue one must symlink
$TERM.ti -file to ~/.$TERM.ti and call it in .profile with 'tic .$TERM.ti' to get it loaded
issue described here:
https://github.com/neovim/neovim/issues/2048#issuecomment-78045837

