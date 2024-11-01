{ self, pkgs, ... }: {

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

  environment.systemPackages = with pkgs; [
    colima
    docker
    lima
    kubectl
  ];

  homebrew = {
    casks = [
      "discord"
      "netnewswire"
      "obsidian"
      "ollama" # Ollama menubar indicator
      "slack"
      "utm"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
