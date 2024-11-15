## p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## ZSH Configuration
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_STRATEGY=(history)

## Oh-My-ZSH related things
# Load zsh plugins
plugins=(
  aws
  azure
  docker
  direnv
  extract
  fluxcd
  fluxcd
  gcloud
  gh
  git
  golang
  gpg-agent
  helm
  history
  history-substring-search
  istioctl
  jira
  kubectl
  kubectx
  man
  opentofu
  operator-sdk
  terraform
  tmux
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Set powerlevel10k as theme, needs to be done before sourcing oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Load zsh functions and aliases
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)
for file in ~/.config/zsh/aliases/*; do source $file; done

# Souring
source <(fzf --zsh)

# Misc
export K9S_CONFIG_DIR=~/.config/k9s

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
