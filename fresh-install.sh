#!/bin/sh
echo ""
echo "  (\.   \      ,/) "
echo "   \(   |\     )/    Hear Ye, hear Ye! There be magic ahead!"
echo "   //\  | \   /\\ "
echo "  (/ /\_#oo#_/\ \)   This script downloads zsh and tmux, and configure it according to my"
echo "   \/\  ####  /\/    preferences. This script will replace existing configurations!"
echo ""

read -p "Are ye alright with this? (y/n) " RESP
if [ "$RESP" == "y" ]; then
  echo "brew: installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "brew: installing zsh..."
  brew install zsh

  echo "brew: installing tmux..."
  brew install tmux

  echo "zsh: installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  echo "zsh: adding plugins..."
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
  git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  echo "zsh: removing .zshrc if it exsists..."
  rm ${HOME}/.zshrc

  echo "misc: creating ~/.config if it does not exist..."
  mkdir ${HOME}/.config

  echo "zsh: adding syslinks for configs..."
  ln -s ${PWD}/.zshrc ${HOME}/.zshrc
  ln -s ${PWD}/.config/zsh/aliases ${HOME}/.config/zsh/aliases
  ln -s ${PWD}/.config/zsh/functions ${HOME}/.config/zsh/functions
  ln -s ${PWD}/themes/sardine.zsh-theme ${HOME}/.oh-my-zsh/themes/sardine.zsh-theme

  echo "tmux: removing .tmux.conf if it exists..."
  rm ${HOME}/.tmux.conf

  echo "tmux: adding syslinks for configs..."
  ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf
  ln -s ${PWD}/.config/tmux/tmux.theme ${HOME}/.config/tmux/tmux.theme
  ln -s ${PWD}/.config/tmux/scripts/ ${HOME}/.config/tmux

  echo "tmux: set scripts as executeables..."
  chmod +x ${HOME}/.config/tmux/scripts/*

  echo "vim: removing .vim if it exsists..."
  rm ${HOME}/.vim

  echo "vim: adding syslinks for configs..."
  ln -s ${PWD}/.vim ${HOME}/.vim

  echo "git: adding syslinks for git configs..."
  ln -s ${PWD}/.gitconfig ${HOME}/.gitconfig
  ln -s ${PWD}/.gitignore ${HOME}/.gitignore

  echo "All done!"
  echo "You can now set /usr/local/bin/tmux as your default terminal shell"
else
  echo ""
  echo "Script failed successfully!"
fi
