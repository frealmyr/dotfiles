# Dotfiles

This repository is cloned as a bare repository into a sub-directory in your home folder. The directory containing the git copy of this repository will be placed under `~/.dotfiles`.

```bash
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone --bare https://github.com/frealmyr/dotfiles.git
```

To add changes made your dotfiles, you need to run git commands with some arguments for pointing the `.dotfiles` as the git repository folder and your home folder as the working tree.

Easiest way to do this, is to add a alias for the `.dotfiles` repository:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Downloading the latest commit
```bash
dotfiles pull
```

Using a different branch for dotfiles
```bash
dotfiles checkout macos
```

Add / edit files:
```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "add vimrc"
dotfiles push
```

Using ssh instead of https:
```bash
dotfiles remote set-url origin git@github.com:frealmyr/dotfiles-configs.git
```

To ignore all untracked files, which is files in the home folder that is not present in the git repository. Configure the git repository to ignore all untracked files:
```bash
dotfiles config status.showUntrackedFiles no
```

Only files present i the repository will then be tracked.

# Ansible

I use Ansible to configure all of my machines, [you can have a look at the playbook that configures dotfiles here.](https://github.com/frealmyr/ansible/blob/master/ansible/dotfiles.yml)
