## Fresh install guide
![Alt text](example.png?raw=true "Terminal example")

#### Terminal Configuration
1. Clone this repository to a permanent location, as we need to set up some syslinks. I prefer having this folder in `${HOME}/Repositories/frealmyr/dotfiles`, as i sort my repositories under users & organizations.
2. Run the `fresh-install.sh` for either MacOS or Ubuntu, if you trust me ofc.😄 If you are sane, then you might want to run each commando seperately.
3. Remember to change the git username and signingkey in `$HOME/.gitconfig`

#### MacOS Terminal Configuration
1. Import `themes/Dracula_custom.terminal` profile to the terminal using the cog button under profiles.
2. Select the imported profile and press `Default` next to the cog.
3. Under Encodings, de-select everything expect UTF-8

#### Firefox Configuration
Firefox is configuration is mostly manual, [see this image for how it looks.](https://github.com/frealmyr/dotfiles/tree/master/firefox)

1. To figure out your Firefox profile id, visit `about:profiles` in Firefox.
2. Navigate to `Library/Application Support/Firefox/Profiles` and enter the folder containing your Firefox profile id
2. Use `pwd | pbcopy` to copy the Firefox profile location
3. Add a syslink for the custom stylesheet (this disables top tabs) to the profile folder, using `ln -s '$(pbpaste)' ${HOME}/Repositories/frealmyr/firefox/chrome`
4. Download the TreeStyleTab plugin for firefox, select the dark theme. Under the plugin's advanced settings paste the content from `./firefox/treeStyleTab.css`
5. Enter the url `about:config`, edit the variables and values from `./firefox/about-config`

#### Git Work Folders
I found manually cloning every repositories for each customers a real PITA, so i created a script for fetching all repositories from an organization without any content to my local machine.

Checkout the script in `./scripts/git-grab-repo-folders.sh`. Add a github token with full `repo` scope and enter a desired organization to fetch repos from.
