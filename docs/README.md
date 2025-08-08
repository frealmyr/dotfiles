<div align="center">
    <img alt="NixOS" src="https://fmlab.no/assets/images/typing-anime.gif" width="240px"/>
    <h1>dotfiles 💙</h1>
</div>

- Root of this repository is the root of my home directory.
  - This is done using a [bare git repository](https://git-scm.com/book/en/v2/Git-on-the-Server-Getting-Git-on-a-Server), which sets the working directory to the home folder, and git directory to `~/.dotfiles`.
  - Using `showUntrackedFiles=false`, only tracked files will be visible in git commands for the dotfiles.
- Ansible playbooks are placed under `~/ansible-config`.
  - This is used for configuring my MacOS system, packages and git repo.

### Fresh install

After installing a fresh instance of MacOS, I temporary clone this repository and run my ansible-playbooks:

```bash
git clone --depth 1 https://github.com/frealmyr/dotfiles.git /tmp/dotfiles
cd /tmp/dotfiles/ansible-config
./provision
```

### Post install

#### Dotfiles

I make use of a alias for managing my dotfiles, `dtf`:

```bash
alias dtf='/usr/bin/git --git-dir=$HOME/.dtf/ --work-tree=$HOME'
```

Only checked in files are tracked.

For adding all changes made to tracked files I use:

```bash
dtf add -u
dtf commit -m "changes"
dtf push -u origin main
```

And `dtf add ./config/newapp` if the files are not tracked yet.

#### Ansible

Whenever I configure MacOS, I add more functionality to the playbooks in `playbooks/` and then re-run the individual playbook. Keeping the playbooks updated.

> Tip for adding `osx_defaults` tasks in playbook, is to dump your existing configuration using the `defaults read -g` command.
