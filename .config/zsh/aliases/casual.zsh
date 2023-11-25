# Quality of life improvements
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias bat='bat --theme=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Coldark-Dark || echo Coldark-Cold) --color="always"'
alias ls='ls -1 --color=tty'

# Flatpak
# alias code="flatpak run --command=code --file-forwarding com.visualstudio.code --enable-features=Vulkan,UseOzonePlatform 
# --ozone-platform=wayland 2> /dev/null"

# AWS
alias awssso='aws sso login --profile ap'