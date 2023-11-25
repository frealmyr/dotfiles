## Append PATHs
# Override binaries with GNU tooling
export PATH="/opt/homebrew/bin:$PATH"
HOMEBREW_PREFIX=$(brew --prefix)
for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:$HOME/.local/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

## ZSH
# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

## Misc
# Ensure that UTF-8 is used
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color # Alacritty will mess up SSH client input
