## Ayush's Configs

These are my somewhat working configs for nvim and zsh. I'll expand more on them later on. `git clone` & `sudo bash install`. : )

### Requirementes
Ensure you have the following
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms) / [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki).
- stow (`sudo apt-get install stow`)
- git (`sudo apt-get install git`)

### Installation
1) If you're not inside your home directory. Go there with `cd ~`.
2) Clone the repo, `git clone https://github.com/is-it-ayush/.dotfiles.git`.
3) CD into it, `cd .dotfiles`.
4) Run the Install script, `sudo bash install`.

### What install does?
The install script simply stows (links) the files from ~/.dotfiles into their
respective locations within the file system. For example: It'll link the nvim
folder to ~/.config/nvim so nvim can read it.

### Troubleshooting
- Ensure that `./install` script has executable perms.
If not, do `chmod +x install` to fix it.
