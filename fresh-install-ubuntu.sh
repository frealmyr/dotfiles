#!/bin/sh

echo ""
echo "---"
echo "checking and installing latest updates..."
sudo apt update && sudo apt full-upgrade -y

echo ""
echo "---"
echo "apps: installing apt applications.."
sudo apt install -y htop zsh tmux vim grub-customizer firefox thunderbird

echo ""
echo "---"
echo "apps: installing slack, bitwarden, spotify and vscode..."
sudo snap install slack --classic \
    && sudo snap install bitwarden \
    && sudo snap install spotify \
    && sudo snap install code --classic

echo ""
echo "---"
echo "system: installing gtk and icon theme..."
sudo add-apt-repository ppa:papirus/papirus
sudo apt install -y arc-theme papirus-icon-theme

echo ""
echo "---"
echo "apps: install flatpak..."
sudo mkdir -p /etc/portage/repos.conf
sudo bash -c "cat >/etc/portage/repos.conf/flatpak-overlay.conf <<EOL
[flatpak-overlay]
priority = 50
location = /usr/local/portage/flatpak-overlay
sync-type = git
sync-uri = git://github.com/fosero/flatpak-overlay.git
auto-sync = Yes
EOL"

echo ""
echo "---"
echo "apps: install newsflash.."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.gitlab.newsflash

echo ""
echo "---"
echo "docker: installing latest docker..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo ""
echo "---"
echo "docker: adding signing key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo ""
echo "---"
echo "docker: adding the docker repository"
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

echo ""
echo "---"
echo "docker: installing docker from apt.."
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

echo ""
echo "---"
echo "docker: add current user to docker group..."
sudo usermod -aG docker ${USER}

echo ""
echo "---"
echo "docker: installing gpg and pass as this is a dependency for secure docker storage..."
sudo apt update && sudo apt install -y gpg pass

echo ""
echo "---"
echo "docker: generate GPG key-pair for pass backend..."
echo ""
echo "Attention!"
echo "Store this password in a password manager, it will be used during every docker pull."
echo "It can be saved to your keychain so that you only need to type it in once during the first pull."
echo ""
stty -echo
read -p "GPG Pub/Key Password: " PASS_PASSWORD
stty echo
gpg --batch --generate-key <<EOF
    %echo Generating a random password key for docker credential pass store...
    Key-Type: default
    Subkey-Type: default
    Name-Real: Docker Rocks
    Name-Comment: Random password priv/pub for docker credentials
    Name-Email: docker@rocks.srsly
    Expire-Date: 0
    Passphrase: $PASS_PASSWORD
EOF
PUB_KEY=$(gpg --list-public-keys --with-colons \
    | sed -ne '/^pub:/,/^fpr:/ { /^fpr:/ p }' \
    | cut -d: -f10)
echo ""

echo ""
echo "---"
echo "docker: initializing pass with public_key"
pass init $PUB_KEY
echo ""

# If you run into trouble with multiple GPG keys, you can run gpg `--list-secret-keys --with-colons --fingerprint`, then `gpg --delete-secret-keys --fingerprint` <FINGERPRINT> and `gpg --delete-keys --fingerprint <FINGERPRINT>`

echo ""
echo "---"
echo "docker: installing docker-credential-helpers for securly storing passwords..."
wget https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz
tar xvf docker-credential-pass-v0.6.3-amd64.tar.gz
chmod +x ./docker-credential-pass
sudo mv ./docker-credential-pass /usr/local/bin/docker-credential-pass
echo '{ "credsStore": "pass" }' > ~/.docker/config.json
rm docker-credential-pass-v0.6.3-amd64.tar.gz

echo ""
echo "---"
echo "docker: installing docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo ""
echo "---"
echo "misc: creating ~/.config if it does not exist..."
mkdir ${HOME}/.config

echo ""
echo "---"
echo "zsh: installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ""
echo "---"
echo "zsh: adding plugins..."
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${HOME}/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-docker.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo ""
echo "---"
echo "zsh: removing zsh config if it exsists..."
rm -rf ${HOME}/.config/zsh
rm ${HOME}/.zshrc

echo ""
echo "---"
echo "zsh: adding syslinks for configs..."
mkdir ${HOME}/.config/zsh
ln -s ${PWD}/.zshrc ${HOME}/.zshrc
ln -s ${PWD}/.config/zsh ${HOME}/.config
ln -s ${PWD}/themes/sardine.zsh-theme ${HOME}/.oh-my-zsh/themes/sardine.zsh-theme

echo ""
echo "---"
echo "tmux: removing tmux configuration if it exists..."
rm -rf ${HOME}/.config/tmux
rm ${HOME}/.tmux.conf


echo ""
echo "---"
echo "tmux: adding syslinks for configs..."
mkdir ${HOME}/.config/tmux
ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf
ln -s ${PWD}/.config/tmux ${HOME}/.config

echo ""
echo "---"
echo "vim: removing .vim if it exsists..."
rm -rf ${HOME}/.vim

echo ""
echo "---"
echo "vim: adding syslinks for configs..."
ln -s ${PWD}/.vim ${HOME}/.vim

echo ""
echo "---"
echo "git: remove configuration if it exists..."
rm ${HOME}/.gitconfig ${HOME}/.gitignore

echo ""
echo "---"
echo "git: adding syslinks for git configs..."
ln -s ${PWD}/.gitconfig ${HOME}/.gitconfig
ln -s ${PWD}/.gitignore ${HOME}/.gitignore

echo ""
echo "---"
echo "zsh: add xclip for simulating pbpaste..."
sudo apt update && sudo apt install -y xclip

echo ""
echo "---"
echo "system: do not swap unless neccecary..."
sudo sh -c "echo 'vm.swappiness=1' >> /etc/sysctl.conf"

#echo ""
#echo "---"
#echo "terminal: add nord colorscheme..."
#mkdir -p ~/.local/share/xfce4/terminal/colorschemes
#cat >~/.local/share/xfce4/terminal/colorschemes/nord.theme <<EOL
#[Scheme]
#Name=Nord
#ColorCursor=#D8DEE9
#ColorForeground=#D8DEE9
#ColorBackground=#2E3440
#TabActivityColor=#88C0D0
#ColorPalette=#3B4252;#BF616A;#A3BE8C;#EBCB8B;#81A1C1;#B48EAD;#88C0D0;#E5E9F0;#4C566A;#BF616A;#A3BE8C;#EBCB8B;#81A1C1;#B48EAD;#8FBCBB;#ECEFF4
#ColorBold=#D8DEE9
#ColorBoldUseDefault=FALSE
#EOL
