# base variables.
export SSH_KEY="/home/ayush/.ssh/id_rsa.pub"
export XDG_CONFIG_HOME="$HOME/.config"
export LOCAL="/usr/local/"
export DOT_LOCAL="$HOME/.local"
export SBIN="/usr/sbin"
export EXTRA_STORAGE="$HOME/things"
# export LLVM_TOOLS="$HOME/personal/llvm-project/build"
# export GRADLE_USER_HOME="$EXTRA_STORAGE/tools/android-gradle"


# applications
export LD_LIBRARY_PATH="/usr/local/lib" # llvm
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PNPM_HOME="$DOT_LOCAL/share/pnpm" # pnpm
export TMPDIR="$EXTRA_STORAGE/tmp" # general tmp dir
export CONTAINER_SSHKEY="$SSH_KEY"
export MANPATH="$LOCAL/man:$MANPATH" # manual
export WINEPREFIX="/home/ayush/games/wine/prefixes/default/win64"
export OLLAMA_MODELS="/home/ayush/personal/ollama"

# lang.
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8


# terminal
export EDITOR=nvim
export TERM="tmux-256color"
export TERM_PROGRAM="alacritty"
export TERMINAL="$LOCAL/bin/alacritty"


# path
export PATH="$PNPM_HOME:$HOME/bin:$DOT_LOCAL/bin:$LOCAL/bin:$SBIN:$LLVM_TOOLS/bin:$ANDROID_STUDIO:$PATH"
