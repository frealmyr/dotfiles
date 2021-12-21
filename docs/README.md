To configure a new ubuntu distro, install `ansible` and `git`, then run:

```bash
ansible-galaxy collection install community.general
ansible-pull -U https://github.com/frealmyr/dotfiles.git main.yml
```

#### Ansible will do the following

- Install packages
	- apt update & full-upgrade
	- install apt packages
	- install snap packages
	- install asdf
		- add entry to bashrc (for scripts)
		- add plugins
		- install plugins
- Apply eyecandy
	- set regolith theme to dracula
- Download config files
	- fetch seperate [git repo](https://github.com/frealmyr/dotfiles-configs) to home folder
	- set zsh as default shell for user
- Configure firefox
	- create work and home profiles
	- disable open last profile, gain promt to choose profile when opening firefox
	- copy user.js (about:settings) and userChrome.css to generated profiles

#### Updating configs

Config files are stored in a seperate [git repo](https://github.com/frealmyr/dotfiles-configs), after making changes locally, you can create and push commits from the home directory.

If you create new files, make sure to add them in `.gitignore` as all files are ignored by default.

To use ssh instead of https for git push:

```bash
cd ~
git remote set-url origin git@github.com:frealmyr/dotfiles-configs.git
```
