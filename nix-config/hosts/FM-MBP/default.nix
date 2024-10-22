{ pkgs, ... }: {

  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shellAliases = {
    nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/nix-config";
  };

  environment.systemPackages = with pkgs; [
      colima
      docker
      lima
      neofetch
    ];

  homebrew = {
    casks = [
      "discord"
      "moonlight"
      "netnewswire"
      "obs"
      "prusaslicer"
      "steam"
      "tailscale"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
