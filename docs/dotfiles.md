In our homefolder, we make use of a bare git repository, which is a git repository without a working tree and copies of checked out files.

Alias is created for managing the dotfiles, which can be run anywhere:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Downloading the latest commit:
```bash
dotfiles pull
```

Using a different branch for dotfiles:
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

Use ssh instead of https:
```bash
dotfiles remote set-url origin git@github.com:frealmyr/dotfiles-configs.git
```

#### References
- https://www.atlassian.com/git/tutorials/dotfiles
- https://bitbucket.org/durdn/cfg/raw/master/.bin/install.sh
