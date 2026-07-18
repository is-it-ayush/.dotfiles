# base variables.
export SSH_KEY="/home/ayush/.ssh/id_rsa.pub"
export XDG_CONFIG_HOME="$HOME/.config"
export LOCAL="/usr/local"
export DOT_LOCAL="$HOME/.local"
export SBIN="/usr/sbin"
export EXTRA_STORAGE="$HOME/things"
# export LLVM_TOOLS="$HOME/personal/llvm-project/build"
# export GRADLE_USER_HOME="$EXTRA_STORAGE/tools/android-gradle"


# applications
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PNPM_HOME="$DOT_LOCAL/share/pnpm" # pnpm
export TMPDIR="$EXTRA_STORAGE/tmp" # general tmp dir
export CONTAINER_SSHKEY="$SSH_KEY"
export MANPATH="$LOCAL/man:$MANPATH" # manual
export WINEPREFIX="/media/ayush/secondary/games/wine/prefixes/default/win64"
export OLLAMA_MODELS="/media/ayush/secondary/models"
export DISABLE_AUTO_TITLE='true'

# lang. (some of the variables don't update automatically under locale, thus we manually override)
export LANG="hi_IN.UTF-8"
export LANGUAGE="hi_IN:hi:en_IN:en"
export LC_TIME="hi_IN.UTF-8"        # clock in Hindi
export LC_MESSAGES="hi_IN.UTF-8"    # UI strings in Hindi
export LC_NUMERIC="en_IN.UTF-8"     # sane number formatting
export LC_MONETARY="en_IN.UTF-8"    # currency formatting

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# terminal
export EDITOR=nvim
export TERM="tmux-256color"
export TERM_PROGRAM="alacritty"
export TERMINAL="$LOCAL/bin/alacritty"


# path
export PATH="$PNPM_HOME:$HOME/bin:$DOT_LOCAL/bin:$LOCAL/bin:$SBIN:$LLVM_TOOLS/bin:$ANDROID_STUDIO:$PATH"
