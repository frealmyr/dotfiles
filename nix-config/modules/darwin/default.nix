{ self, ... }: {
  imports = [
    ./settings/homebrew.nix
    ./settings/nix-daemon.nix
    ./settings/ollama.nix
    ./settings/pkgs.nix
    ./settings/security.nix
    ./settings/system.nix
    ./settings/yabai.nix
  ];

  # Nix settings, no touchy
  system.configurationRevision = self.rev or self.dirtyRev or null; # Set Git commit hash for darwin-version.
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
