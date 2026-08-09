<div align="center">
    <img src="https://fmlab.no/assets/images/typing-anime.gif" width="240px"/>
    <h1>dotfiles 💙</h1>
</div>

#### Pull dotfiles to homedir as bare git repository in ~/.dotfiles

```bash
git clone --bare https://github.com/frealmyr/dotfiles.git $HOME/.dotfiles
alias dtf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dtf config --local status.showUntrackedFiles no
dtf checkout
```

#### Use Mise to configure MacOS

> Grant Terminal Full Disk Access first, to allow changes to `defaults` command.

```bash
curl https://mise.run | sh
mise bootstrap
```

## Making changes

Swap from `HTTPS` to `SSH`

```bash
dtf remote set-url origin git@github.com:frealmyr/dotfiles.git
```

To stage, commit and push all changes made to dotfiles

```bash
dtf add -u
dtf commit -m "changes"
dtf push -u origin main
```

Add untracked files directly

```bash
dtf add ./config/newapp
```
