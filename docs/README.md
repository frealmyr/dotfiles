<div align="center">
    <img alt="NixOS" src="https://fmlab.no/assets/images/typing-anime.gif" width="240px"/>
    <h1>dotfiles</h1>
</div>

- Root of this repository is the root of my home directory.
  - This is done using a [bare git repository](https://git-scm.com/book/en/v2/Git-on-the-Server-Getting-Git-on-a-Server), which sets the working directory to the home folder, and git directory to `~/.dotfiles`.
  - Using `showUntrackedFiles=false`, only tracked files will be visible in git commands for the dotfiles.
- A flake for nix-darwin is placed under `~/nix-config`.
  - This is used for configuring my MacOS system, homebrew and nixpkgs.
  - [home-manager](https://github.com/nix-community/home-manager) was too blackbox for my taste, as I prefer to edit my dotfiles directly.

<details>
<summary>Quick Start</summary>
<br>

1. Install `git` the "apple-way".

```bash
xcode-select --install
```

2. Install Nix using the [determinate system installer](https://github.com/DeterminateSystems/nix-installer).

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf 'extra-trusted-substituters = https://nix-community.cachix.org' 'extra-trusted-public-keys = nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs='
```

3. Clone this repository to root of home directory.

```bash
git clone --recurse-submodules -j8 --bare https://github.com/frealmyr/dotfiles.git $HOME/.dotfiles/

alias dtf='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"'
dtf config status.showUntrackedFiles no
dtf config submodule.recurse true
dtf submodule update --init --recursive
dtf status
```

4. Build and use the flake for nix-darwin.

```bash
nix run nix-darwin -- switch --flake ~/nix-config
```

5. Reboot for good measure.

</details>

<details>
<summary>How to iterate?</summary>
<br>

First, use ssh instead of http for the dotfiles repo:

```bash
dtf remote set-url origin git@github.com:frealmyr/dotfiles.git
```

Dotfiles can be added to git using a alias:

```bash
alias dtf='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"'
dtf status
dtf add ~/.config/something.conf
dtf commit -m "punny msg"
dtf push -u origin macos
```

Changes made to Nix-darwin flake, can be rolled out using this command:

```bash
darwin-rebuild switch --flake ~/nix-config
```

</details>
