## Append PATHs
# Override binaries with GNU tooling
export PATH="/opt/homebrew/bin:$PATH"
HOMEBREW_PREFIX=$(brew --prefix)
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
export TERM=xterm-256color

# Make direnv output gray for less visual noise
export DIRENV_LOG_FORMAT=$'\033[2mdirenv: %s\033[0m'

# Editors
export EDITOR=nvim

# Added by Toolbox App
export PATH="$PATH:/Users/fredrick/Library/Application Support/JetBrains/Toolbox/scripts"
