# Quality of life improvements
#alias code="flatpak run com.visualstudio.code"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#alias bat='batcat --theme="Monokai Extended Bright"'

if [[ $(uname -a) == *"Ubuntu"* ]]; then
  alias ls='ls -1 --color=tty'
else
  alias ls='ls -G'
fi

# Simulate pbcopy and pbpaste from MacOS on Ubuntu
if [[ $(uname -a) == *"Ubuntu"* ]]; then
  if ! command -v pbcopy &> /dev/null
  then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
  fi
fi
