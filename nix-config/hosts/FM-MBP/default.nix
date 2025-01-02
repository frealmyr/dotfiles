{ pkgs-unstable, ... }: {

  environment.systemPackages = with pkgs-unstable; [
    colima
    docker
    lima
    fastfetch
    exiftool
  ];

  homebrew = {
    casks = [
      "actual"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "digikam"
      "discord"
      "gog-galaxy"
      "moonlight"
      "netnewswire"
      "netspot"
      "obs"
      "obsidian"
      "prusaslicer"
      "steam"
      "tailscale"
      "topaz-denoise-ai"
      "utm"
    ];
  };

  environment.shellAliases = {
    nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/nix-config";
  };

  # Nix settings
  nix.settings.trusted-users = [ "fredrick" ]; # Danger! https://github.com/NixOS/nix/issues/6672#issuecomment-2335184129
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
