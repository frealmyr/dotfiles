{
  description = "Nix MacOS Workstation Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix.url = "https://flakehub.com/f/DeterminateSystems/nix/2.0";
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure that pkgs follows stable channel, paranoia since I'm also using unstable.
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nix, darwin }:
    let
      pkgs-unstable = nixpkgs-unstable.legacyPackages."aarch64-darwin";
    in {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      specialArgs = { inherit self pkgs-unstable; };
      modules = [
        nix.darwinModules.default
        ./modules/common
        ./modules/darwin
        ./hosts/FM-MBP
      ];
    };
    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      specialArgs = { inherit self pkgs-unstable; };
      modules = [
        nix.darwinModules.default
        ./modules/common
        ./modules/darwin
        ./hosts/FM-WORK
      ];
    };
  };
}
