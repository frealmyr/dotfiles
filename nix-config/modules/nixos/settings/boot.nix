{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernel.sysctl = {
      "vm.swappiness" = 0; # Avoid swapping
    };
    kernelPackages = pkgs.linuxPackages_latest;
    tmp.cleanOnBoot = true;
  };
}
