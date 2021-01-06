#!/bin/sh

echo ""
echo "---"
echo "checking and installing latest updates..."
sudo apt update && sudo apt full-upgrade -y

echo ""
echo "---"
echo "apps: installing apt applications.."
sudo apt install -y zsh tmux vim bat python3

echo ""
echo "---"
echo "apps: install google-cloud-sdk.."
sudo snap install google-cloud-sdk --classic

echo ""
echo "---"
echo "misc: creating ~/.config if it does not exist..."
mkdir ${HOME}/.config

echo ""
echo "---"
echo "zsh: installing oh-my-zsh..."
rm -rf ${HOME}/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ""
echo "---"
echo "zsh: adding plugins..."
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${HOME}/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-docker.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${HOME}/.oh-my-zsh/custom/plugins/zsh-history-substring-search

echo ""
echo "---"
echo "zsh: removing zsh config if it exsists..."
rm -rf ${HOME}/.config/zsh
rm ${HOME}/.zshrc

echo ""
echo "---"
echo "zsh: adding syslinks for configs..."
ln -s ${PWD}/../.zshrc ${HOME}/.zshrc
ln -s ${PWD}/../.config/zsh ${HOME}/.config
ln -s ${PWD}/../themes/sardine.zsh-theme ${HOME}/.oh-my-zsh/themes/sardine.zsh-theme

echo ""
echo "---"
echo "tmux: removing tmux configuration if it exists..."
rm -rf ${HOME}/.config/tmux
rm ${HOME}/.tmux.conf


echo ""
echo "---"
echo "tmux: adding syslinks for configs..."
ln -s ${PWD}/../.tmux.conf ${HOME}/.tmux.conf
ln -s ${PWD}/../.config/tmux ${HOME}/.config

echo ""
echo "---"
echo "vim: removing .vim if it exsists..."
rm -rf ${HOME}/.vim

echo ""
echo "---"
echo "vim: adding syslinks for configs..."
ln -s ${PWD}/../.vim ${HOME}/.vim

echo ""
echo "---"
echo "git: remove configuration if it exists..."
rm ${HOME}/.gitconfig ${HOME}/.gitignore

echo ""
echo "---"
echo "git: adding syslinks for git configs..."
ln -s ${PWD}/../.gitconfig ${HOME}/.gitconfig
ln -s ${PWD}/../.gitignore ${HOME}/.gitignore

echo ""
echo "---"
echo "zsh: add xclip for simulating pbpaste..."
sudo apt update && sudo apt install -y xclip

echo ""
echo "---"
echo "system: do not swap unless neccecary..."
sudo sh -c "echo 'vm.swappiness=1' >> /etc/sysctl.conf"

echo ""
echo "---"
echo "terminal: add nord colorscheme..."
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cat >~/.local/share/xfce4/terminal/colorschemes/nord.theme <<EOL
[Scheme]
Name=Nord
ColorCursor=#D8DEE9
ColorForeground=#D8DEE9
ColorBackground=#2E3440
TabActivityColor=#88C0D0
ColorPalette=#3B4252;#BF616A;#A3BE8C;#EBCB8B;#81A1C1;#B48EAD;#88C0D0;#E5E9F0;#4C566A;#BF616A;#A3BE8C;#EBCB8B;#81A1C1;#B48EAD;#8FBCBB;#ECEFF4
ColorBold=#D8DEE9
ColorBoldUseDefault=FALSE
EOL
