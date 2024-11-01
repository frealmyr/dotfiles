{
  description = "Nix superpowers, lets go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs@{ self, nix, nixos-hardware, nixpkgs, nixpkgs-darwin, darwin }: {
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

    nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/common { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./modules/nixos { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/nixos-vm { inherit self inputs pkgs; })
      ];
    };
  };
}
