# # p10k instant prompt
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ZSH Configuration
DISABLE_AUTO_UPDATE="true" # brew handles updates
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_STRATEGY=(history)

# Load zsh plugins
plugins=(aws azure fluxcd gh istioctl jira operator-sdk docker extract git golang gpg-agent helm history-substring-search history kubectl kubectl kubectx man terraform tmux you-should-use)

# Oh-My-ZSH related things
source $ZSH/oh-my-zsh.sh
source "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"

# History options should be set in .zshrc and after oh-my-zsh sourcing.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# # SSH / GPG
# export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
# gpg-connect-agent -q /bye
GPG_TTY="$(tty)"
export GPG_TTY

# Environment Variables
export DIRENV_LOG_FORMAT=$'\033[2mdirenv: %s\033[0m'
export EDITOR=vi

# Load zsh functions and aliases
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)
for file in ~/.config/zsh/aliases/*; do source $file; done

# Use fzf for bash/zsh functions
# https://github.com/junegunn/fzf?tab=readme-ov-file#fuzzy-completion-for-bash-and-zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Souring
source <(fzf --zsh)
# source ~/.p10k.zsh
