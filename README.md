### Ayush's Configurations

These are my personal configurations for setting up my environment.
To setup, Make sure you have the following;
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms) / [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki).
- stow (`sudo apt-get install stow`)
- git (`sudo apt-get install git`)

Now follow the following instructions,
1.) If you're not inside your home directory. Go there with `cd ~`.
2.) Clone the repo, `git clone https://github.com/is-it-ayush/.dotfiles.git`.
3.) CD into it, `cd .dotfiles`.
4.) Run the Install script, `sudo bash install`.

### Common Troubleshooting
- If you get any error like it's not found or somnething when running `sudo bash install`. Make sure it has executebale permissions. If not, simply do `chmod +x install.sh`. That should fix it.
