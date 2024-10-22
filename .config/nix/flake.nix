{
  description = "Nix superpowers, lets go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    # nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin }: {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ...}: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ...}: import ./hosts/FM-MBP/darwin.nix { inherit self inputs pkgs; })
      ];
    };

    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/FM-WORK/darwin.nix { inherit self inputs pkgs; })
      ];
    };
  };
}
