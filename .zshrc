# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# Update shell PATH with custom locations
export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH

# Ensure that UTF-8 is used
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Autoload tmux
ZSH_TMUX_AUTOSTART=true

# Load zsh plugins
plugins=(docker extract git history history-substring-search tmux you-should-use zsh-autosuggestions zsh-syntax-highlighting)

# Oh-My-ZSH related things
ZSH_THEME="sardine"
source $ZSH/oh-my-zsh.sh

# Set cloudsdk installation and enable zsh autocomplete
if [[ $(uname -a) == *"Darwin"* ]]; then
  export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
elif [[ $(uname -a) == *"Ubuntu"* ]]; then
  source "/snap/google-cloud-sdk/current/path.zsh.inc"
  source "/snap/google-cloud-sdk/current/completion.zsh.inc"
fi

# Enable kubectl autocompletion
source <(kubectl completion zsh)
complete -F __start_kubectl k

# Enable stern autocompletion
source <(stern --completion=zsh)
complete -F __start_stern ktail

# Git ssh config
git config --global url."git@github.com:".insteadOf "https://github.com/"

# Golang
export GOROOT=/usr/local/go
export GOPROXY=direct
export GO111MODULE=on
export GOSUMDB=off
export PATH=$GOROOT/bin:$PATH

# Load zsh functions and aliases
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)
for file in ~/.config/zsh/aliases/*; do source $file; done
