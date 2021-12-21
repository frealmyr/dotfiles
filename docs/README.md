To configure a new ubuntu distro, install `ansible` and run:

```bash
ansible-pull -U https://github.com/frealmyr/dotfiles.git main.yml
```

Ansible will do the following

	- install packages
		- update & full-upgrade distro
		- install packages using apt
		- install snap packages
		- install asdf
			- add entry to bashrc (for scripts)
			- add plugins
			- install plugins
	- apply eyecandy
		- set regolith theme to dracula
	- download configfiles
		- fetch seperate git repo to home folder 
	- configure firefox
		- create work and home profiles
		-	disable open last profile, gain promt to choose profile when opening firefox
		- copy user.js (about:settings) and userChrome.css to generated profiles
