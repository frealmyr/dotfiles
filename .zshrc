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
source ~/.zsh_custom/plugins/git.plugin.zsh
source ~/.zsh_custom/plugins/zsh-completion-waiting-dots.zsh
source ~/.zsh_custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh_custom/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source ~/.zsh_custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# HISTORY
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
setopt APPENDHISTORY             # Ensures that each command entered in the current session is appended to the history file immediately after execution
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt INC_APPEND_HISTORY        # History file is updated immediately after a command is entered
setopt SHARE_HISTORY             # Share history between all sessions.
# END HISTORY

function _p10k_on_winch() { p10k reload }
TRAPWINCH() { _p10k_on_winch }

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fredrick/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
