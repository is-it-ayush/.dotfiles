# helpers
export SSH_KEY="/home/ayush/.ssh/id_rsa.pub"
export XDG_CONFIG_HOME="$HOME/.config"
export LOCAL="/usr/local/"
export DOT_LOCAL="$HOME/.local"
export SBIN="/usr/sbin"/
export EXTRAS_DRIVE="/mnt/sda4"
export LLVM_TOOLS="$HOME/personal/llvm-project/build"
export ANDROID_STUDIO="/mnt/sda4/tools/android-studio/bin"
export GRADLE_USER_HOME="/mnt/sda4/tools/android-gradle"


# applications
export LD_LIBRARY_PATH="$LLVM_TOOLS/lib:$LD_LIBRARY_PATH" # llvm
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PNPM_HOME="$DOT_LOCAL/share/pnpm" # pnpm
export TMPDIR="$EXTRAS_DRIVE/tmp" # general tmp dir
export CONTAINER_SSHKEY="$SSH_KEY"
export MANPATH="$LOCAL/man:$MANPATH" # manual
export ANDROID_HOME="/mnt/sda4/tools/android-sdk"


# lang.
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US
export LC_CTYPE=en_US.UTF-8
export GDM_LANG=en_US


# terminal
export EDITOR=nvim
export TERM="alacritty"
export TERM_PROGRAM="alacritty"
export TERMINAL="$LOCAL/bin/alacritty"


# path
export PATH="$PNPM_HOME:$HOME/bin:$DOT_LOCAL/bin:$LOCAL/bin:$SBIN:$LLVM_TOOLS/bin:$ANDROID_STUDIO:$PATH"
