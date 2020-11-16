export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

ZSH_TMUX_AUTOSTART=true

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
ZSH_THEME="sardine"

plugins=(docker osx brew extract git history tmux you-should-use zsh-autosuggestions zsh-syntax-highlighting)

# Path and list of ZSH functions to load
fpath=(~/.config/zsh/functions $fpath)
autoload -Uz \
  flushdns forgetti go kcdelete kcrename \
  kgenocide kns kpull kwatch lint printcolors \
  tfa tflogin tfp tfw update

# Source alias files
source ${HOME}/.config/zsh/aliases/casual
source ${HOME}/.config/zsh/aliases/k8s
source ${HOME}/.config/zsh/aliases/terraform

# Oh-My-ZSH related things
source $ZSH/oh-my-zsh.sh

# Set cloudsdk location and enable zsh autocomplete
export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Enable kubectl autocompletion
source <(kubectl completion zsh)
complete -F __start_kubectl k

# Enable stern autocompletion
source <(stern --completion=zsh)
complete -F __start_stern ktail
