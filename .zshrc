export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Ensure UTF-8 is set as character encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set default text editor
export EDITOR=vim

# Autostart tmux
ZSH_TMUX_AUTOSTART=true

# Path to your zsh functions
fpath=(~/.config/zsh/functions $fpath)
autoload -Uz bbc bw flushdns gcloud gcurl go gsutil helm k kcc kcls kcow kcrename kdow kiow know kns knsd kpow kpull kset ksow printcolors terraform yaml-lint

# Folder for custom files
ZSH_CUSTOM=$HOME/.oh-my-custom/

# Theme to load from ~/.oh-my-zsh/themes/
ZSH_THEME="sardine"

# Plugins to load
plugins=(git docker osx common-aliases brew extract tmux vagrant you-should-use zsh-syntax-highlighting zsh-autosuggestions)

# Source alias files
source ${HOME}/.config/zsh/aliases

source $ZSH/oh-my-zsh.sh
