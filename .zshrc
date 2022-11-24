# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# Update shell PATH with custom locations
export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:$HOME/.asdf/installs/krew/0.4.3/bin:$HOME/.local/bin::$PATH

# Ensure that UTF-8 is used
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set libva driver
export LIBVA_DRIVER_NAME=iHD

export TERM=xterm-256color # Alacritty will mess up SSH client input

# Zsh settings
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# Load zsh plugins
plugins=(asdf docker extract git history history-substring-search tmux you-should-use zsh-autosuggestions zsh-syntax-highlighting)

# Oh-My-ZSH related things
ZSH_THEME="freddy"
source $ZSH/oh-my-zsh.sh

# Set cloudsdk installation and enable zsh autocomplete
source "$(asdf where gcloud)/completion.zsh.inc"
source "$(asdf where gcloud)/path.zsh.inc"

# Enable kubectl autocompletion
source <(kubectl completion zsh)
complete -F __start_kubectl k

# Enable stern autocompletion
source <(stern --completion=zsh)
complete -F __start_stern ktail

#source <(gh completion -s zsh)
#complete -K _gh gh

complete -o nospace -C "$(asdf where terraform)/bin/terraform" terraform

# GPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent /bye
export GPG_TTY=$TTY

# Golang
#export GOROOT=/usr/local/go
export GOROOT=$(asdf where golang)/go
export GOPROXY=direct
export GO111MODULE=on
export GOSUMDB=off
export PATH=$GOROOT/bin:$PATH

# Load zsh functions and aliases
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)
for file in ~/.config/zsh/aliases/*; do source $file; done

# Start a new tmux session when opening a new shell
# if [ -z $TMUX ] && [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then
#   tmux new -s session_$RANDOM;
# fi
