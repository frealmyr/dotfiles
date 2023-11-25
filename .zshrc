# Zsh settings
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# Load zsh plugins
plugins=(asdf direnv docker extract git history history-substring-search tmux you-should-use zsh-autosuggestions zsh-syntax-highlighting)

# Oh-My-ZSH related things
ZSH_THEME="freddy"
source $ZSH/oh-my-zsh.sh

# Set cloudsdk installation and enable zsh autocomplete
source "$(asdf where gcloud)/completion.zsh.inc"
source "$(asdf where gcloud)/path.zsh.inc"

## Auto-completion
source <(kubectl completion zsh)
complete -F __start_kubectl k

#source <(stern --completion=zsh)
#complete -F __start_stern ktail

# source <(gh completion -s zsh)
# complete -K _gh gh
complete -o nospace -C "$(asdf where terraform)/bin/terraform" terraform

# # SSH / GPG
# export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
# gpg-connect-agent -q /bye
# export GPG_TTY=$TTY

# Golang
export GOROOT=$(asdf where golang)/go
export GOPROXY=direct
export GO111MODULE=on
export GOSUMDB=off
#export PATH=$GOROOT/bin:$PATH

# Terraform / CDKTF
export TERRAFORM_BINARY_NAME="$(asdf which terraform)"

# direnv
export DIRENV_LOG_FORMAT=""

# Load zsh functions and aliases
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)
for file in ~/.config/zsh/aliases/*; do source $file; done

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
