{ self, pkgs, ... }: {

  networking.hostName = "FM-WORK";
  nixpkgs.hostPlatform = "aarch64-darwin";

  ## ZScaler Fuckery
  nix.settings.ssl-cert-file = "/opt/nix-and-zscaler.crt";
  security.pki.certificates = [
    "/opt/nix-and-zscaler.crt"
  ];
  environment.extraInit = ''
    export SSL_CERT_FILE=/opt/nix-and-zscaler.crt
  '';
  environment.shellAliases = {
    nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/nix-config";
  };

  # Required for allowing to set substituters for cachix
  nix.settings.trusted-users = [ "fredrick" ];

  environment.systemPackages = with pkgs; [
    colima
    docker
    lima
    kubectl
    k9s
  ];

  homebrew = {
    casks = [
      "discord"
      "netnewswire"
      "obsidian"
      "ollama" # Ollama menubar indicator
      "slack"
      "utm"
      "xbar"
      "stats"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
