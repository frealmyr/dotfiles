{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  powerManagement.cpuFreqGovernor = lib.mkForce "powersave";

  systemd.sleep.extraConfig = ''
    AllowHibernation=no
    AllowSuspend=no
  '';

  services.openssh.enable = true;
  networking.hostName = "nixos-vm";
  networking.firewall.allowedTCPPorts = [
    22
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  # virtualisation.docker = {
  #   enable = true;
  #   liveRestore = false;
  #   autoPrune.enable = true;
  #   autoPrune.dates = "weekly";
  # };

  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/mnt/data".options = [ "noatime" "discard" ];

  system.stateVersion = "24.05"; # No touchy, even after upgrading!
}
