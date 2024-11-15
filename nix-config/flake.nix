{
  description = "Nix superpowers, lets go!";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
  };

  outputs = inputs@{ self, nixpkgs, darwin }: {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/common { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/FM-MBP { inherit self inputs pkgs; })
      ];
    };

    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/common { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/FM-WORK { inherit self inputs pkgs; })
      ];
    };
  };
}
