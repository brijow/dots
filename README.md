# My Neovim config

> *A recent rewrite of my config in lua that is closely based on the [kickstart.nvim project](https://github.com/nvim-lua/kickstart.nvim).*.

## Installation

#### 1. Install Neovim

> **Note:** This conifg targets *only* the latest
> ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
> ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.

#### 2. Install External Dependencies

- `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons

#### 3. Install this config

> **Note:** on Linux, MacOS, `$XDG_CONFIG_HOME/nvim` is `~/.config/nvim`

```sh
git clone https://github.com/brijow/dots.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## References

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
