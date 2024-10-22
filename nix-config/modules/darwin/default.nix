{ self, ... }: {

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Hardware-specific stuff
  security.pam.enableSudoTouchIdAuth = true;

  imports = [
    ./settings/direnv.nix
    ./settings/environment.nix
    ./settings/fonts.nix
    ./settings/gnupg.nix
    ./settings/homebrew.nix
    ./settings/ollama.nix
    ./settings/pkgs.nix
    ./settings/system.nix
    ./settings/yabai.nix
    ./settings/zsh.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
