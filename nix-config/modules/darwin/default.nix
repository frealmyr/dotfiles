{ self, ... }: {
  imports = [
    ./settings/homebrew.nix
    ./settings/keybindings.nix
    ./settings/nix-daemon.nix
    ./settings/ollama.nix
    ./settings/pkgs.nix
    ./settings/security.nix
    ./settings/system.nix
    ./settings/yabai.nix
  ];

  # Nix settings, no touchy
  nix.enable = false; # Use determinate, see https://determinate.systems/posts/nix-darwin-updates/
  system.configurationRevision = self.rev or self.dirtyRev or null; # Set Git commit hash for darwin-version.
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
