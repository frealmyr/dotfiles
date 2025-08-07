## p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## ZSH Configuration
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_CUSTOM=$HOME/.zsh_custom

## Oh-My-ZSH related things
# Load zsh plugins
plugins=(
  aws
  azure
  docker
  direnv
  extract
  fluxcd
  git
  golang
  gpg-agent
  helm
  history
  history-substring-search
  kubectl
  terraform
  you-should-use
  zsh-autosuggestions
  fast-syntax-highlighting
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

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fredrick/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
eval "$(mise activate zsh)"
