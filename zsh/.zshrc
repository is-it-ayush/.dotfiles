# Environments & Stuff
export PNPM_HOME="/home/isitayush/.local/share/pnpm" # setup pnpm
export XDG_CONFIG_HOME=$HOME/.config # Need this for vim & other things.
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export PATH=$PNPM_HOME:$HOME/bin:/usr/local/bin:$PATH
source /home/isitayush/.profile # This get's missing commands from bash, also a lonely setting with no header hehe.

# OMZ stuff.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Something I forgor.💀
source $ZSH/oh-my-zsh.sh

# Just Some Config
DISABLE_LS_COLORS="true" # disables colors in ls
ENABLE_CORRECTION="true" # autocorrects commands
HIST_STAMPS="dd.mm.yyyy" # eh, time.
plugins=(git) # fancy plugins. ✨
unsetopt correct_all # disables auto-correct.
unsetopt correct

# ALIASSSES! 💙
alias vim="nvim"
alias v="nvim"

alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias gl="git log" # thanks @samvdst
alias gs="git status"
alias gc="git commit"
alias gca="git commit --amend"

alias zc="nvim ~/.dotfiles"
alias ozc="nvim ~/.oh-my-zsh"
alias work="cd ~/work/"
alias personal="cd ~/personal/"
alias lla="ls -all"
alias ncg="npm list -g --depth=0 | cut -d ' ' -f 2 | tail -n +2 | tr '\n\r' ' ' | clip.exe" # copy global npm packages
alias cat="batcat" # better cat : )

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

# this is just nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# This will help zsh to ask me for my gpg pass in a nice way. :)
GPG_TTY=$(tty)
export GPG_TTY=$(tty)

# Some Useful Stuff
eval "$(github-copilot-cli alias -- "$0")" # ??, gh?, git?. Cool Copilot CLI stuff.

# Turso & ssh-ident.
export PATH="~/bin:/home/isitayush/.turso:$PATH"

# Flyctl
export FLYCTL_INSTALL="/home/isitayush/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# https://stackoverflow.com/a/48509425/13266368
# https://rabexc.org/posts/pitfalls-of-ssh-agents
# SSH Agent Thingy. Ensure the agent is running.

# Note: /dev/null is a black hole where any data sent, will be discarded.
# Use it if you want to run a command but don't want to see the output.
ssh-add -l &>/dev/null
if [ "$?" -eq 2 ]; then
    # Could not open a connection to your authentication agent.

    # Load stored agent connection info.
    test -r ~/.ssh-agent && \
        eval "$(<~/.ssh-agent)" >/dev/null

    ssh-add -l &>/dev/null
    if [ "$?" -eq 2 ]; then
        # Start agent and store agent connection info.
        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
    fi
fi

# Load identities
ssh-add -l &>/dev/null
if [ $? -eq 1 ]; then
    # The agent has no identities.
    # Time to add one.
    ssh-add -t 4h
fi
