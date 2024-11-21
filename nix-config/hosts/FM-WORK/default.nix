{ pkgs-unstable, ... }: {

  environment.systemPackages = with pkgs-unstable; [
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

  ## ZScaler fuckery, see docs/zscaler.md
  # Adds HTTPS MITM cert to nix-daemon and nix cli.
  nix.settings.ssl-cert-file = "/opt/nix-and-zscaler.crt";
  environment.variables.NIX_SSL_CERT_FILE = "/opt/nix-and-zscaler.crt";
  # Adds HTTPS MITM cert to other clis, such as cURL, which brew is using.
  environment.variables.CURL_CA_BUNDLE = "/opt/nix-and-zscaler.crt";
  environment.variables.SSL_CERT_FILE = "/opt/nix-and-zscaler.crt";

  # Nix settings
  nix.settings.trusted-users = [ "fredrick" ]; # Grant more privileges to nix-daemon, required for allowing to set substituters for cachix
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
