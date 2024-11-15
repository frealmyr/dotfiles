{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    colima
    docker
    k9s
    kubectl
    lima
  ];

  homebrew = {
    casks = [
      "discord"
      "netnewswire"
      "obsidian"
      "slack"
      "stats"
      "utm"
      "xbar"
    ];
  };

  environment.shellAliases = {
    nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/nix-config";
  };

  # ZScaler fuckery, see docs/zscaler.md
  nix.settings.ssl-cert-file = "/opt/nix-and-zscaler.crt"; # Adds HTTPS MITM cert to nix-daemon
  environment.variables.NIX_SSL_CERT_FILE = "/opt/nix-and-zscaler.crt"; # Adds HTTPS MITM cert to nix cli
  environment.variables.SSL_CERT_FILE = "/opt/nix-and-zscaler.crt"; # Adds HTTPS MITM cert to other cli, such as cURL, which brew is using.

  # Nix settings
  nix.settings.trusted-users = [ "fredrick" ]; # Required for allowing to set substituters for cachix
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
