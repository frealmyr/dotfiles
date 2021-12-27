### Provisioning a ubuntu distro

```bash
curl -sL fmlab.no/provision.sh | bash
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
		- set global versions
	- install dpkg packages
- Apply eyecandy
	- set regolith theme to dracula
- Download config files
	- set zsh as default shell for user
	- setup bare git repo in home folder
- Configure firefox
	- create work and home profiles
	- disable open last profile, gain promt to choose profile when opening firefox
	- copy user.js (about:settings) and userChrome.css to generated profiles

#### Updating configs

Config files are stored in a seperate [git repo](https://github.com/frealmyr/dotfiles-configs), see [dotfiles.md](dotfiles.md) for more details
