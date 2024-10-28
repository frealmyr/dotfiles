{ self, pkgs, ... }: {

  import = [
    ./settings/autoupgrade.nix
    ./settings/boot.nix
    ./settings/gc.nix
    ./settings/locale.nix
    ./settings/users.nix
  ];

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
  };
}
