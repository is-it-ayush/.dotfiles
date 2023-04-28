# Environments & Stuff
export PNPM_HOME="/home/isitayush/.local/share/pnpm" # setup pnpm
export XDG_CONFIG_HOME=$HOME # Need this for vim & other things.
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export PATH=$PNPM_HOME:$HOME/bin:/usr/local/bin:$PATH

source /home/isitayush/.profile # This get's missing commands from bash, also a lonely setting with no header hehe.

# OMZ stuff.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Just Some Config
DISABLE_LS_COLORS="true" # disables colors in ls
ENABLE_CORRECTION="true" # autocorrects commands
HIST_STAMPS="dd.mm.yyyy" # eh, time.
plugins=(git) # fancy plugins. ✨
unsetopt correct_all # disables auto-correct.
unsetopt correct

# Something I forgor.💀
source $ZSH/oh-my-zsh.sh

# ALIASSSES! 💙
alias zc="nano ~/.zshrc"
alias ozc="nano ~/.oh-my-zsh"
alias work="cd ~/work/"
alias personal="cd ~/personal/"
alias lla="ls -all"

### Don't know but this was added by zinit installer. So Gotta be useful ig.  :<
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source $HOME/.local/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# disbale auto-correct

GPG_TTY=$(tty)
export GPG_TTY=$(tty)

# This is for testing Github Copilot CLI. It should add ??, gh? & git? to the command line.
eval "$(github-copilot-cli alias -- "$0")"

