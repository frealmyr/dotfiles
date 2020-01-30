export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set default text editor
export EDITOR=vim

# Path to your zsh functions
fpath=(~/.config/zsh/functions $fpath)
autoload -Uz bbc bw flushdns gcloud gcurl go gsutil helm k kcc kcls kcow kcrename kdow kiow know kns knsd kpow kpull kset ksow printcolors terraform yaml-lint

# Folder for custom files
ZSH_CUSTOM=$HOME/.oh-my-custom/

ZSH_TMUX_AUTOSTART=true

ZSH_THEME="fishy"

# Plugins to load
if [[ $OSTYPE == 'darwin'* ]]; then
	plugins=(git iterm2 osx common-aliases brew extract tmux vagrant)
else
	plugins=(git common-aliases extract tmux vagrant)
fi

source $ZSH/oh-my-zsh.sh
