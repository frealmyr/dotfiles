{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    colima
    docker
    lima
    neofetch
  ];

  homebrew = {
    casks = [
      "actual"
      "discord"
      "moonlight"
      "netnewswire"
      "obs"
      "obsidian"
      "prusaslicer"
      "steam"
      "tailscale"
      "utm"
    ];
  };

  environment.shellAliases = {
    nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/nix-config";
  };

  # Nix settings
  nix.settings.trusted-users = [ "fredrick" ]; # Required for allowing to set substituters for cachix
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
