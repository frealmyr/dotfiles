# Dotfiles

This repository is cloned as a bare repository into your home folder. The directory containing the git copy of this repository will be placed under `~/.dotfiles`.

To add changed made your dotfiles, you need to run git commands with some arguments for pointing the `.dotfiles` as the git repository folder and your home folder as the working tree.

Easiest way to do this, is to add a alias for the `.dotfiles` repository:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Then you can just use the `dotfiles` alias for running git commands in your home folder:
```bash
dotfiles add ./config/zsh
dotfiles rm ./config/tmux/tmux.theme
dotfiles reset --hard HEAD
```

## Untracked files

To ignore all untracked files, which is files in the home folder that is not present in the git repository. Configure the git repository to ignore all untracked files:

```bash
dotfiles config status.showUntrackedFiles no
```

Only files present i the repository will then be tracked.

# Ansible

I use Ansible to configure all of my machines, [you can have a look at the playbook that configures dotfiles here.](https://github.com/frealmyr/ansible/blob/master/ansible/dotfiles.yml)
