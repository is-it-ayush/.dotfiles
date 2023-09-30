source ~/.dotfiles/zsh/.envrc
source "$HOME/.cargo/env"
source /home/ayush/.profile


# prompt for gpg pass via term
GPG_TTY=$(tty)
export GPG_TTY=$(tty)


# zinit, a zsh plugin manager.
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
zinit snippet OMZ::plugins/git/git.plugin.zsh


# ohmyzsh thingy.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
DISABLE_LS_COLORS="true" # disables colors in ls
ENABLE_CORRECTION="true" # autocorrects commands
HIST_STAMPS="dd.mm.yyyy" # eh, time.
unsetopt correct_all # disables auto-correct.
unsetopt correct


# aliases 💙
source ~/.dotfiles/zsh/.aliases

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ssh sessions to prevent reprompting of passwords.
# https://stackoverflow.com/a/48509425/13266368
# https://rabexc.org/posts/pitfalls-of-ssh-agents
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
ssh-add -l &>/dev/null
if [ $? -eq 1 ]; then
    ssh-add -t 4h
fi
fpath+=${ZDOTDIR:-~}/.zsh_functions


# applications
export PATH="~/bin:/home/ayush/.turso:$PATH" # turso
export FLYCTL_INSTALL="/home/ayush/.fly" # flyctl
export PATH="$FLYCTL_INSTALL/bin:$PATH"
[ -s "/home/ayush/.bun/_bun" ] && source "/home/ayush/.bun/_bun" # bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
