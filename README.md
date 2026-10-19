# dotfiles

macOS (Apple silicon) setup. Elixir first, zsh + oh-my-zsh, neovim locally / vim on remote hosts,
iTerm2 (Ghostty on trial), herdr with tmux as fallback, Rectangle for windows.

## New machine

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone git@github.com:veturi/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
curl https://mise.run | sh   # version manager (asdf still works, see below)
```

`install.sh` is safe to re-run. It runs `brew bundle`, installs oh-my-zsh and TPM, and symlinks
everything. Anything already in the way is moved to `~/.dotfiles-backup/<timestamp>/`.
`SKIP_BREW=1 ./install.sh` to only relink. At the end it lists the manual steps still left.

## Layout

| Path | Linked to |
|---|---|
| `zsh/zshrc` | `~/.zshrc` |
| `git/gitconfig`, `git/gitignore_global` | `~/.gitconfig`, `~/.gitignore_global` |
| `vim/core.vim` | `~/.vimrc` (shared plugin-free core) |
| `vim/colors` | `~/.vim/colors` |
| `config/nvim` | `~/.config/nvim` (sources `core.vim`, adds plugins) |
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `config/herdr/config.toml` | `~/.config/herdr/config.toml` |
| `config/ghostty` | `~/.config/ghostty` |
| `config/fd` | `~/.config/fd` (global ignores for fzf file search) |
| `iterm/veturi.json` | iTerm2 DynamicProfiles |
| `rectangle/rectangle.sh` | run manually, writes Rectangle prefs |

Machine specific config that shouldn't be shared goes in `~/.zshrc.local` and
`~/.gitconfig.local` (e.g. work email). Both are sourced if present.

## Version managers

`.zshrc` activates mise if it's installed, otherwise asdf shims. Never both.
Both read `.tool-versions`, so projects work with either while migrating.

## Vim / Neovim

- `vim/core.vim` has all settings and keymaps, no plugins. On a remote host:
  `curl -fsSL https://raw.githubusercontent.com/veturi/dotfiles/master/vim/core.vim -o ~/.vimrc`
- Neovim: lazy.nvim, treesitter, native LSP, blink.cmp, nvim-lint (credo on save).
  First start installs plugins. Then `:MasonInstall expert` (or `elixir-ls`) for Elixir.
  `expert` is used if found on PATH, otherwise elixir-ls.

## iTerm2

The profile is loaded as a Dynamic Profile. Set it as default in Settings → Profiles.
Colors: `iterm/gruvbox.itermcolors`, `iterm/anderson.itermcolors`.

## tmux

Prefix is `§` (herdr uses `ctrl+space`). After first start press `§ I` to install plugins
(resurrect, continuum).

## Logitech Litra Glow lights on Elgato Stream Deck

1. Build [hidapitester](https://github.com/todbot/hidapitester#compiling) from source (older
   versions lack `--serial`) and copy it to `/usr/local/bin`
2. `litra_<option>` functions come from `zsh/litra.zsh`, loaded by `.zshrc`. Serial numbers are
   hardcoded there, get them with `hidapitester --list-details`
3. Create a macOS Shortcut running a shell script:
   `source ~/dotfiles/zsh/litra.zsh && litra_off`
4. Add the Shortcuts to the Stream Deck and skip installing Logitech G HUB.
