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
      "battery"
      "digikam"
      "discord"
      "moonlight"
      "netnewswire"
      "netspot"
      "obs"
      "obsidian"
      "prusaslicer"
      "stats"
      "starsector"
      "steam"
      "tailscale"
      "topaz-denoise-ai"
      "utm"
    ];
  };

  environment.shellAliases = {
    nixswitch = "darwin-rebuild switch --flake ~/nix-config";
  };

  # Fix stuttering when streaming games over Moonlight
  launchd.daemons.streamingcheck = {
    script = ''
      test -n "$(pgrep 'streaming_client|Steam Link|Moonlight')" && {
          /sbin/ifconfig awdl0 down;
          /sbin/ifconfig llw0 down;
          echo "down";
          # NOTE: I don't use handoff/continuity, so always disabled.
          ## Disable continuity handoff feature
          # defaults write "/Users/$USERNAME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool no;
      } || {
          /sbin/ifconfig awdl0 up;
          /sbin/ifconfig llw0 up;
          echo "up";
          # NOTE: I don't use handoff/continuity, so always disabled.
          ## Enable continuity handoff feature
          # defaults write "/Users/$USERNAME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool yes;
      }
    '';
    serviceConfig = {
      EnvironmentVariables = {
        USERNAME = "fredrick";
      };
      StartInterval = 60;
      ThrottleInterval = 0;
      # RunAtLoad = true;
      StandardOutPath = "/var/log/streamingcheck.out.log";
      StandardErrorPath = "/var/log/streamingcheck.err.log";
    };
  };

  # Nix settings
  nix.settings.trusted-users = [ "fredrick" ]; # Danger! https://github.com/NixOS/nix/issues/6672#issuecomment-2335184129
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
