#!/bin/sh

echo "checking and installing latest updates..."
sudo apt update && sudo apt full-upgrade -y

echo "installing zsh, tmux and vim..."
sudo apt install -y zsh tmux vim

echo "installing slack, bitwarden, spotify and vscode..."
sudo snap install slack --classic \
    && sudo snap install bitwarden \
    && sudo snap install spotify \
    && sudo snap install code --classic

echo "installing latest docker..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "adding signing key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "adding the docker repository"
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

echo "docker: installing docker from apt.."
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "docker: installing gpg and pass as this is a dependency for secure docker storage..."
sudo apt update && sudo apt install -y gpg pass

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

echo "docker: initializing pass with public_key"
pass init $PUB_KEY
echo ""

# If you run into trouble with multiple GPG keys, you can run gpg `--list-secret-keys --with-colons --fingerprint`, then `gpg --delete-secret-keys --fingerprint` <FINGERPRINT> and `gpg --delete-keys --fingerprint <FINGERPRINT>`

echo "docker: installing docker-credential-helpers for securly storing passwords..."
wget https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz
tar xvf docker-credential-pass-v0.6.3-amd64.tar.gz
chmod +x ./docker-credential-pass
sudo mv ./docker-credential-pass /usr/local/bin/docker-credential-pass
echo '{ "credsStore": "pass" }' > ~/.docker/config.json

echo "docker: installing docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "misc: creating ~/.config if it does not exist..."
mkdir ${HOME}/.config

echo "zsh: installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "zsh: adding plugins..."
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${HOME}/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-docker.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "zsh: removing .zshrc if it exsists..."
rm ${HOME}/.zshrc

echo "zsh: adding syslinks for configs..."
mkdir ${HOME}/.config/zsh
ln -s ${PWD}/.zshrc ${HOME}/.zshrc
ln -s ${PWD}/.config/zsh/aliases ${HOME}/.config/zsh/aliases
ln -s ${PWD}/.config/zsh/functions ${HOME}/.config/zsh/functions
ln -s ${PWD}/themes/sardine.zsh-theme ${HOME}/.oh-my-zsh/themes/sardine.zsh-theme

echo "tmux: removing .tmux.conf if it exists..."
rm ${HOME}/.tmux.conf

echo "tmux: marking scripts as executables..."
chmod +x ${HOME}/.config/tmux/scripts/git-changes.sh
chmod +x ${HOME}/.config/tmux/scripts/git-stash.sh

echo "vim: removing .vim if it exsists..."
rm -rf ${HOME}/.vim

echo "vim: adding syslinks for configs..."
ln -s ${PWD}/.vim ${HOME}/.vim

echo "git: adding syslinks for git configs..."
ln -s ${PWD}/.gitconfig ${HOME}/.gitconfig
ln -s ${PWD}/.gitignore ${HOME}/.gitignore
ln -s ${PWD}/.config/tmux/tmux.theme ${HOME}/.config/tmux/tmux.theme
ln -s ${PWD}/.config/tmux/scripts/ ${HOME}/.config/tmux

echo "tmux: mark scripts as executables..."
chmod +x ${HOME}/.config/tmux/scripts/git-changes.sh
chmod +x ${HOME}/.config/tmux/scripts/git-stash.sh

echo "vim: removing .vim if it exsists..."
rm ${HOME}/.vim

echo "vim: adding syslinks for configs..."
ln -s ${PWD}/.vim ${HOME}/.vim

echo "git: adding syslinks for git configs..."
ln -s ${PWD}/.gitconfig ${HOME}/.gitconfig
ln -s ${PWD}/.gitignore ${HOME}/.gitignore
