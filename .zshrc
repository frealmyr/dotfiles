DISABLE_AUTO_UPDATE="true" # brew handles updates
COMPLETION_WAITING_DOTS="true"

# export PATH=/Users/fredrick/miniforge3/condabin:$PATH

# Load zsh plugins
plugins=(asdf direnv docker extract git history history-substring-search tmux you-should-use zsh-autosuggestions zsh-syntax-highlighting)

# Oh-My-ZSH related things
# ZSH_THEME="freddy"
source $ZSH/oh-my-zsh.sh

# Set cloudsdk installation and enable zsh autocomplete
source "$(asdf where gcloud)/completion.zsh.inc"
source "$(asdf where gcloud)/path.zsh.inc"

## Auto-completion
# source <(kubectl completion zsh)
# complete -F __start_kubectl k
# export PATH="${PATH}:${HOME}/.krew/bin"

#source <(stern --completion=zsh)
#complete -F __start_stern ktail

# source <(gh completion -s zsh)
# complete -K _gh gh
# complete -o nospace -C "$(asdf where terraform)/bin/terraform" terraform

# # SSH / GPG
# export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
# gpg-connect-agent -q /bye
# export GPG_TTY=$TTY

# Golang
# export GOROOT=$(asdf where golang)/go
# export GOPROXY=direct
# export GO111MODULE=on
# export GOSUMDB=off
# export PATH=$PATH:$GOPATH/bin

# Terraform / CDKTF
# export TERRAFORM_BINARY_NAME="$(asdf which terraform)"
# export KUBECONFIG=~/.kube/config

# direnv
export DIRENV_LOG_FORMAT=""
# export CLOUDSDK_PYTHON=/Users/fredrick/.asdf/installs/python/3.10.11/bin/python

# Load zsh functions and aliases
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)
for file in ~/.config/zsh/aliases/*; do source $file; done

# source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# Use fzf for bash/zsh functions
# https://github.com/junegunn/fzf?tab=readme-ov-file#fuzzy-completion-for-bash-and-zsh
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
