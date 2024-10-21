# Quality of life improvements
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias bat='bat --theme=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Coldark-Dark || echo Coldark-Cold) --color="always"'
alias ls='ls -1 --color=tty'
