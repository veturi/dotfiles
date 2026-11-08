#!/usr/bin/env bash
# Idempotent setup: safe to re-run. Existing files are moved to ~/.dotfiles-backup/<timestamp>/
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$DOTFILES/$1" dst="$2"
  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    return
  fi
  if [[ -e "$dst" || -L "$dst" ]]; then
    mkdir -p "$BACKUP"
    mv "$dst" "$BACKUP/"
    echo "backed up $dst"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "linked $dst -> $src"
}

# Homebrew packages
if command -v brew >/dev/null && [[ "${SKIP_BREW:-}" != 1 ]]; then
  brew bundle --file "$DOTFILES/Brewfile"
fi

# oh-my-zsh (keep our .zshrc)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Shell
link zsh/zshrc "$HOME/.zshrc"

# Git
link git/gitconfig "$HOME/.gitconfig"
link git/gitignore_global "$HOME/.gitignore_global"

# Vim (plain vim uses the shared core) & Neovim
link vim/core.vim "$HOME/.vimrc"
link vim/colors "$HOME/.vim/colors"
link config/nvim "$HOME/.config/nvim"

# tmux + TPM
link tmux/tmux.conf "$HOME/.tmux.conf"
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# herdr (only the config file, the dir holds runtime state)
link config/herdr/config.toml "$HOME/.config/herdr/config.toml"

# herdr-app (desktop app): only personal files, the dir holds generated files and runtime state
link config/herdr-app/settings.json "$HOME/.config/herdr-app/settings.json"
link config/herdr-app/keys.json "$HOME/.config/herdr-app/keys.json"
link config/herdr-app/themes/gruvbox.json "$HOME/.config/herdr-app/themes/gruvbox.json"

# fd global ignores
link config/fd "$HOME/.config/fd"

# Ghostty: use ~/.config/ghostty. The macOS location is loaded after it and
# would override, so move it out of the way.
link config/ghostty "$HOME/.config/ghostty"
GHOSTTY_MAC="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
if [[ -f "$GHOSTTY_MAC" && ! -L "$GHOSTTY_MAC" ]]; then
  mkdir -p "$BACKUP"
  mv "$GHOSTTY_MAC" "$BACKUP/"
  echo "backed up $GHOSTTY_MAC"
fi

# iTerm2 dynamic profile
link iterm/veturi.json "$HOME/Library/Application Support/iTerm2/DynamicProfiles/veturi.json"

# Manual steps that can't be scripted
manual=()
[[ -d /Applications/iTerm.app ]] && manual+=("iTerm2: Settings > Profiles > select 'veturi' > Other Actions > Set as Default")
[[ -d /Applications/Rectangle.app ]] && manual+=("Rectangle: quit it, run $DOTFILES/rectangle/rectangle.sh, start it again and grant Accessibility access")
[[ -d "$HOME/.tmux/plugins/tmux-resurrect" ]] || manual+=("tmux: start tmux and press § then I to install plugins (resurrect, continuum)")
[[ -d "$HOME/.local/share/nvim/mason/packages/expert" || -d "$HOME/.local/share/nvim/mason/packages/elixir-ls" ]] \
  || manual+=("Neovim: open nvim once (plugins install), then :MasonInstall expert (or elixir-ls)")
command -v mise >/dev/null || [[ -d "$HOME/.asdf" ]] || manual+=("Version manager: curl https://mise.run | sh")
command -v herdr >/dev/null || manual+=("herdr: not installed, see https://herdr.dev")
[[ -f "$HOME/.gitconfig.local" ]] || manual+=("Git (optional): work email etc. in ~/.gitconfig.local")
manual+=("Restart the terminal or run: exec zsh")

echo
echo "Done. Manual steps left:"
for i in "${!manual[@]}"; do
  echo "  $((i + 1)). ${manual[$i]}"
done
