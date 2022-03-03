alias h='helm $kns'
alias hv='h version'

# Listing
alias hls='h ls'
alias hlsa='helm ls --all-namespaces'
alias hh='h history'

# Actions
alias hrb='(){printf "\nDo you want to rollback helm release \e[1;33m$1\e[0m to revision \e[1;32m$2\e[0m (y/n)?\n"; read answer; if [ "$answer" != "${answer#[Yy]}" ] ;then; h rollback $1 $2; else; echo "Aborted.."; fi}'
alias hdel='(){printf "\nDo you want to destroy helm release \e[1;31m$1\e[0m (y/n)?\n"; read answer; if [ "$answer" != "${answer#[Yy]}" ] ;then; h uninstall $1; else; echo "Aborted.."; fi}'

# Development
alias ht='h test'
alias hut='h unittest'
