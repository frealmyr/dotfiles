{
  description = "Nix MacOS Workstation Configuration";

  nixConfig = {
    substituters = ["https://cache.nixos.org" "https://nix-community.cachix.org" ];
    trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure that pkgs follows stable channel, paranoia since I'm also using unstable.
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, darwin }:
    let
      pkgs-unstable = nixpkgs-unstable.legacyPackages."aarch64-darwin";
    in {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [
        ./modules/common
        ./modules/darwin
        ./hosts/FM-MBP
      ];
    };
    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      specialArgs = { inherit self pkgs-unstable; };
      modules = [
        ./modules/common
        ./modules/darwin
        ./hosts/FM-WORK
      ];
    };
  };
}
