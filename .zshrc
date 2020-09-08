# Disable "Insecure completion-dependent" warning on MacOS
# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX="true"

# Add additional directories to PATH
export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Ensure UTF-8 is set as character encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set default text editor
export EDITOR=vim

# Autostart tmux
ZSH_TMUX_AUTOSTART=true

# Path and list of ZSH functions to load
fpath=(~/.config/zsh/functions $fpath)
autoload -Uz \
  bbc bw bw-noi flushdns gcloud \
  gcurl gh-update gsutil helm \
  k k-noi kcc kcdelete kcls kcow \
  kcrename kdow kiow know kns knsd \
  kpow kpull kset ksow ktail lint-tf \
  lint-yaml printcolors tf tflogin tfvalidate \

# Folder for custom files
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Theme to load from ~/.oh-my-zsh/themes/
ZSH_THEME="sardine"

# Plugins to automatically load
plugins=(docker osx brew extract tmux you-should-use zsh-autosuggestions zsh-syntax-highlighting)

# Source alias files
source ${HOME}/.config/zsh/aliases/git
source ${HOME}/.config/zsh/aliases/casual
source ${HOME}/.config/zsh/aliases/spotify

# Oh-My-ZSH related things
source $ZSH/oh-my-zsh.sh
