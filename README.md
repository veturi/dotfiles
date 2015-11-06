To get neovim configuration properly set up create a symlink from ~/.vim to ~/.config/nvim
Verify .vimrc is also symlinked to ~/.config/nvim/init.vim

when on OSX and using iTerm there is a bug with NeoVim and xterm256 terminfo sending wrong keycode
on ctrl+h combination (navigation between split screen panes). to fix this issue one must symlink
$TERM.ti -file to ~/.$TERM.ti and call it in .profile with 'tic .$TERM.ti' to get it loaded
issue described here:
https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
