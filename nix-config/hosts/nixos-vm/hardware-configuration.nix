{ config, lib, pkgs, modulesPath, ... }: {
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  ];

  boot.initrd.availableKernelModules = [ "xhcio_pci" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5c4cd817-8fa2-4a5e-b6f1-18971914422";
    fsType = "btrfs";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6B61-644E";
    fsType = "vfat";
    options =[ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/8e775c4c-0a3e-4c13-849d-beb5d470a917"; }
  ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
