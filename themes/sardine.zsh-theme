# ZSH Theme emulating the Fish shell's default prompt.

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

## Disabled directory as i placed the script in tmux instead
# local user_color='green';
# PROMPT='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%} '

local user_color='magenta';
PROMPT='%{$fg[$user_color]%}~%{$reset_color%} '
