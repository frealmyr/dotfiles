## Fresh install guide
![Alt text](example.png?raw=true "Terminal example")

#### zsh, oh-my-zsh, git, vim and tmux
1. Clone repo to a permanent location, as we need to set up some syslinks. (I prefer ${HOME}/Repositories/frealmyr/)
2. Run the `fresh-install.sh` script to setup zsh and tmux.
3. Change the git username/password/signingkey in `.gitconfig`.

#### MacOS Terminal
1. Import `themes/Dracula_custom.terminal` profile to the terminal using the cog button under profiles.
2. Select the imported profile and press `Default` next to the cog.
3. Under Terminal's general pane, select *Shells open with* command, and enter `/usr/local/bin/tmux`
4. Under Encodings, de-select everything expect UTF-8

#### Firefox Beta
Firefox is configuration is mostly manual, [see this image for reference](https://github.com/frealmyr/dotfiles/blob/master/firefox/firefox_screenshot.png)

1. Navigate to `Library/Application Support/Firefox/Profiles` and enter a folder with a random-id containing `beta` in it's name.
2. Use `pwd | pbcopy` to copy the Firefox profile location.
3. Add a syslink for the custom stylesheet (this disables top tabs) to the profile folder, using `ln -s '$(pbpaste)' ${HOME}/Repositories/frealmyr/firefox/chrome`
4. Download the TreeStyleTab plugin for firefox, select the dark theme. Under the plugin's advanced settings paste the content from `./firefox/treeStyleTab.css`
5. Enter the url `about:config` and confirm the risk. Edit the variables and values from `./firefox/about-config`

#### Git work folders
I found manually cloning every repositories for each customers a real PITA, so i created a script for fetching all repositories from an organization without any content to my local machine.

Checkout the script in `./scripts/git-grab-repo-folders.sh`. Add a github token with full `repo` scope and enter a desired organization to fetch repos from. 
