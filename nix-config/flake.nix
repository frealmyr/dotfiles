{
  description = "Nix MacOS Workstation Configuration";

  nixConfig = {
    substituters = ["https://cache.nixos.org" "https://nix-community.cachix.org" ];
    trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
  };

  outputs = inputs@{ self, nixpkgs, darwin }: {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [
        ./modules/common
        ./modules/darwin
        ./hosts/FM-MBP
      ];
    };

    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [
        ./modules/common
        ./modules/darwin
        ./hosts/FM-WORK
      ];
    };
  };
}
