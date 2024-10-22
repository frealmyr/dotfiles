My Nix on MacOS rabbit hole. _Are you certain whatever you're doing is worth it?_

> [!IMPORTANT]
> If you are only on the edge and looking ~~into the abyss~~ Nix, read the [following FAQ](https://github.com/hlissner/dotfiles/tree/master?tab=readme-ov-file#frequently-asked-questions).

#### Excues I tell myself:

  - Make use of [nixpkgs](https://search.nixos.org/packages) for package management.
  - Make use of flakes for project packages.
  - Ditch the security nightmare that is `asdf`.
  - No more seperate bare git repository for dotfiles.
  - Overlaying small changes for hosts on top of a base config.

### Quick Start

1. Install `git` on MacOS.

```bash
xcode-select --install
```

2. Install nix using [determinate system](https://github.com/DeterminateSystems/nix-installer) installer.

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

3. Build and switch to flake.

```bash
nix run nix-darwin -- switch --flake .
```

4. Reboot.