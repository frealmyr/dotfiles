## p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh_custom/themes/powerlevel10k/powerlevel10k.zsh-theme

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

eval "$(mise activate zsh)"

autoload -U compinit; compinit
source ~/.zsh_custom/plugins/fzf-tab/fzf-tab.plugin.zsh
# source ~/.zsh_custom/plugins/zsh-direnv/zsh-direnv.plugin.zsh
source ~/.zsh_custom/plugins/git.plugin.zsh
source ~/.zsh_custom/plugins/zsh-completion-waiting-dots.zsh
source ~/.zsh_custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh_custom/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source ~/.zsh_custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

setopt autocd          # cd to a directory just by typing its name
setopt histignoredups  # avoid duplicate history entries
setopt sharehistory    # share history between terminals
