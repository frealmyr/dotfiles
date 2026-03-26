# Dotfiles

I make use of a bare git repository for my dotfiles, which is a git repository without a working tree and copies of checked out files.

This results in the possibility to have a folder named `~/.dotfiles`, which keeps track of only my committed configuration files in my home folder, without any hacky symlinks.

Basically, this allows me to make my home folder a git repository, where I only keep track of checked in files, ignoring untracked files when using git commands.

I make use of a alias for managing the dotfiles

```bash
alias dtf='/usr/bin/git --git-dir=$HOME/.dtf/ --work-tree=$HOME'
```

### Example commands

Downloading the latest commit

```bash
dtf pull
```

Using a different branch for dotfiles

```bash
dtf checkout x11/i3
```

Add / edit files, then push commit to dotfiles repository

```bash
dtf status
dtf add .vimrc
dtf commit -m "add vimrc"
dtf push origin wayland/sway
```

> If you want to stage all changes, use `dtf add -u`

### Use ssh instead of https

> Ansible playbooks configures my dotfiles with https by default. Due to my new ssh key is not present in github during setup.

```bash
dtf remote set-url origin git@github.com:frealmyr/dotfiles.git
```

### Update submodules

I use submodules for zsh plugins, as I find oh-my-zsh to add too much latency on new terminals.

To get the diff when updating plugins:

```bash
cd ~/.zsh_custom/plugins/zsh-autosuggestions
git fetch origin
git log HEAD..origin/main --oneline
# If changes looks good, then
git merge origin/main
cd ..
dtf add zsh-autosuggestions
dtf commit -m "Update zsh-autosuggestions"
dtf push
```

If you are lazy, check that submodules are working properly, then update all plugins to latest:

```bash
dtf submodule status
dtf submodule update --init --recursive
dtf submodule update --remote --merge
```

If you screwed up submodules in git, here is a nucelar fix:

```bash
rm -rf ~/.dotfiles/modules
dtf submodule sync
dtf submodule update --init --recursive
```