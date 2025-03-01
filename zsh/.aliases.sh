alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias gl="git log" # thanks github.com/@samvdst, hehe
alias gs="git status"
alias gc="git commit"
alias gca="git commit --amend"
alias vim="nvim"
alias v="nvim"
alias vi="nvim"
alias vh="rg -i 'keymap' ~/.dotfiles/nvim/"
alias zc="nvim ~/.dotfiles"
alias ozc="nvim ~/.oh-my-zsh"
alias work="cd ~/work/"
alias personal="cd ~/personal/"
alias lla="ls -all"
alias llah="ls -all -h"
alias tl="tree -L"
alias ncg="npm list -g --depth=0 | cut -d ' ' -f 2 | tail -n +2 | tr '\n\r' ' ' | xclip -sel clip" # copy global npm packages
alias sudo='sudo -E env "PATH=$PATH"'
alias lzd='lazydocker'
alias lzg="lazygit"
alias vms="cd $EXTRA_STORAGE/virtual_machines"
alias recs="cd ~/Videos/Screencasts/"
alias cwd="pwd | xclip -sel c"
alias ssh="TERM=xterm-256color $(which ssh)"
