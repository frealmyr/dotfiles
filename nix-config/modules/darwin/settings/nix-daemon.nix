{ ... }: {
  services.nix-daemon = {
    enable = true;
    logFile = "/var/log/nix-daemon.log";
  };
}