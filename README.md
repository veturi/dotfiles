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
13. Install BAT from brew for syntax hilighting in FZF preview pane
14. Install TMUX Resurrect plugin to ~/.config/tmux/tmux-resurrect (https://github.com/tmux-plugins/tmux-resurrect)
14. Install TMUX Continuum plugin to ~/.config/tmux/tmux-continuum (https://github.com/tmux-plugins/tmux-continuum)
15. Install ASDF version manager
16. Install necessary ASDF packages (node, erlang, elixir, etc)

# BASH ENVIRONMENTS

## document here

To get neovim configuration properly set up create a symlink from ~/.vim to ~/.config/nvim
Verify .vimrc is also symlinked to ~/.config/nvim/init.vim

when on OSX and using iTerm there is a bug with NeoVim and xterm256 terminfo sending wrong keycode
on ctrl+h combination (navigation between split screen panes). to fix this issue one must symlink
$TERM.ti -file to ~/.$TERM.ti and call it in .profile with 'tic .$TERM.ti' to get it loaded
issue described here:
https://github.com/neovim/neovim/issues/2048#issuecomment-78045837


# MACOS General settings and stuff
- Turn off font smoothing from "System Preferences -> General"


# Logitech Litra Glow lights on elgato stream deck
1. Plug in streaming lights to USB ports
2. Copy dotfiles/zsh/custom/aliases.zsh to ~/.oh-my-zsh/custom/aliases.zsh
3. build hidapitester from source to get the latest version and copy to /usr/local/bin to include binary automatically to path. More information in ZSH aliases file
4. Now you can execute litra_<optionhere> aliases from the command line
5. Create MacOS Shortcut for terminal app and execute the relevant command:
   5.1 example script: "source /Users/jarno/.oh-my-zsh/custom/aliases.zsh && litra_off"
6. You can now include the MacOS shortcuts to Elgato stream deck and avoid installing Logitech GHub which is 120% dickballs
