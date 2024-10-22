{ pkgs, ... }: {

  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shellAliases = {
    nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/.config/nix";
  };

  environment.systemPackages = with pkgs; [
      colima
      cowsay
      docker
      fortune
      kind
      lima
      neofetch
      neovim
      pinentry_mac
      skhd
      yabai
    ];

  homebrew = {
    casks = [
      "background-music"
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
