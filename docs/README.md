My Dotfiles + Nix on MacOS rabbit hole.

> [!IMPORTANT]
> If you are only on the edge and looking ~~into the abyss~~ Nix, read the [following FAQ](https://github.com/hlissner/dotfiles/tree/master?tab=readme-ov-file#frequently-asked-questions). _Are you certain whatever you're doing is worth it?_

#### So, what's going on here?

  - Root of this repository is the root of my home directory.
    - This is done using a [bare git repository](https://git-scm.com/book/en/v2/Git-on-the-Server-Getting-Git-on-a-Server), which in this case, sets the working directory to the home folder, and git directory data to `~./dotfiles`.
    - Using the `showUntrackedFiles=false` flag, only tracked files will be shown when running git commands for the dotfiles.
  - A flake for nix-darwin is placed under `~/.config/nix`.
    - This is used for configuring my MacOS system and packages.
    - [home-manager](https://github.com/nix-community/home-manager) was too blackbox for my taste, as I prefer to edit my dotfiles directly.

### Quick Start

1. Install `git` and nix using the [determinate system](https://github.com/DeterminateSystems/nix-installer) installer.

```bash
xcode-select --install
```

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Clone dotfiles to home folder

```bash
git clone --bare https://github.com/frealmyr/dotfiles.git $HOME/.dotfiles/

DOTFILES='--git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git $DOTFILES checkout && \
git $DOTFILES reset --hard && \
git $DOTFILES pull && \
git $DOTFILES config status.showUntrackedFiles no
```

3. Build and switch to flake.

```bash
nix run nix-darwin -- switch --flake ~/.config/nix
```

4. Reboot for good measure.
