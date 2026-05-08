source ~/.dotfiles/zsh/.env.sh
source ~/.cargo/env
source ~/.profile
source ~/.nvm/nvm.sh
source ~/.aliases.sh
source ~/.helper.sh

# prompt for gpg pass via term
GPG_TTY=$(tty)
export GPG_TTY=$(tty)

# unbind alacritty key for use in tmux
bindkey -r "^X^[[Z" # shift + tab

# init zinit
if [[ ! -f $DOT_LOCAL/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{38} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$DOT_LOCAL/share/zinit" && command chmod g-rwX "$DOT_LOCAL/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$DOT_LOCAL/share/zinit/zinit.git" && \
        print -P "%F{38} %F{34}Installation successful.%f%b" || \
        print -P "%F{165} The clone has failed.%f%b"
fi
source $DOT_LOCAL/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit snippet OMZ::plugins/git/git.plugin.zsh

# init omz.
export ZSH=~/.oh-my-zsh
export ZSH_THEME="robbyrussell"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
DISABLE_LS_COLORS="true" # disables colors in ls
ENABLE_CORRECTION="true" # autocorrects commands
HIST_STAMPS="dd.mm.yyyy" # eh, time.
unsetopt correct_all # disables auto-correct.
unsetopt correct

# ssh sessions to prevent reprompting of passwords.
# https://stackoverflow.com/a/48509430/13266368
# https://rabexc.org/posts/pitfalls-of-ssh-agents
ssh-add -l &>/dev/null
if [ "$?" -eq 7 ]; then
    # Could not open a connection to your authentication agent.
    # Load stored agent connection info.
    test -r ~/.ssh-agent && \
        eval "$(<~/.ssh-agent)" >/dev/null

    ssh-add -l &>/dev/null
    if [ "$?" -eq 7 ]; then
        # Start agent and store agent connection info.
        (umask 071; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
    fi
fi
ssh-add -l &>/dev/null
if [ $? -eq 6 ]; then
    ssh-add -t 9h
fi

# prevent shell exit on control+D
setopt ignoreeof

# applications.
export NVM_DIR=~/.nvm
export TURSO_PATH=~/.turso # turso
export FLYCTL_PATH=~/.fly/bin # flyctl
export BUN_PATH=~/.bun/bin
export OPENEMS_PATH="$HOME/opt/openEMS/bin"
export GMSH_PATH="$EXTRA_STORAGE/tools/gmsh/bin"
export GHIDRA_PATH="$EXTRA_STORAGE/tools/ghidra"
export OSS_CAD_PATH="$EXTRA_STORAGE/tools/oss_cad/bin"
export RISCV32_PATH="/opt/riscv32/bin"
export PARAVIEW_PATH="$EXTRA_STORAGE/tools/paraview/bin"
export KITTY_PATH="$DOT_LOCAL/kitty.app/bin"
export TOOL_PATHS=$TURSO_PATH:$FLYCTL_PATH:$BUN_PATH:$ANDROID_STUDIO_PATH:$OPENEMS_PATH:$GMSH_PATH:$GHIDRA_PATH:$RISCV32_PATH:$OSS_CAD_PATH:$PARAVIEW_PATH:$KITTY_PATH

export ANDROID_STUDIO_PATH="$EXTRA_STORAGE/tools/android-studio/bin"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_PATHS="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

export NVHPC_CUDA_HOME="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/cuda"
export NVHPC_CUDA_PATH="$NVHPC_CUDA_HOME/bin"
export NVHPC_PATH="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/compilers/bin"
export MPI_PATH="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/comm_libs/mpi/bin"
export HPC_PATHS="$MPI_PATH:$NVHPC_PATH:$NVHPC_CUDA_PATH:$NVHPC_CUDA_HOME"

export PATH=$TOOL_PATHS:$ANDROID_PATHS:$HPC_PATHS:$PATH

# library paths.
export NVHPC_CUDA_LIBS="$NVHPC_CUDA_HOME/lib64"
export NVHPC_COMPILER_LIBS="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/compilers/lib"
export PARAVIEW_LIBS="$EXTRA_STORAGE/tools/paraview/lib"
export TOKEN_LIBS="/usr/lib/WatchData/ProxKey/lib:/usr/lib/WatchData/pcsc"
# export OMPI_LIBS="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/comm_libs/mpi/lib"
export LINUX_LIBS="/usr/local/lib:/usr/lib/x86_64-linux-gnu"

export LD_LIBRARY_PATH=$LINUX_LIBS:$LD_LIBRARY_PATH:$OMPI_LIBS:$NVHPC_COMPILER_LIBS:$NVHPC_CUDA_LIBS:$PARAVIEW_LIBS:$TOKEN_LIBS

# man paths.
export NVHPC_MAN="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/compilers/man"
export MPI_MAN="$EXTRA_STORAGE/tools/hpc/Linux_x86_64/23.9/comm_libs/mpi/share/man"
export MANPATH="$NVHPC_MAN:$MPI_MAN:$MANPATH"

# autocompletions.
fpath+=$HOME/.zsh_functions
autoload -Uz compinit
compinit
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions
complete -C '/usr/local/bin/aws_completer' aws # aws-cli auto-completion
