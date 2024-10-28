{ self, ... }: {

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Hardware-specific stuff
  security.pam.enableSudoTouchIdAuth = true;

  imports = [
    ./settings/homebrew.nix
    ./settings/ollama.nix
    ./settings/pkgs.nix
    ./settings/system.nix
    ./settings/yabai.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
