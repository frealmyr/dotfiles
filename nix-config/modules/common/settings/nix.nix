{ pkgs, lib, ... }: {

  nix = {
    # Prioritize interactive work over building
    daemonIOLowPriority = true;
    daemonProcessType = "Background";

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true; # This ain't gentoo, use binary cache
      keep-derivations = true;
      keep-outputs = true;
      warn-dirty = false;
      keep-going = true; # Continue building derivations if one fails, corpo vpn sucks
      log-lines = 20;
      max-jobs = "auto";
    };

    package = pkgs.nix;

    # Garbage collect once a week
    gc = {
      automatic = true;
      interval = {
        Hour = 8;
        Minute = 30;
        Day = 7;
      };
      options = "--delete-older-than 1d";
    };

    # Optimize store each morning
    optimise = {
      automatic = true;
      interval = lib.lists.genList (day: {
        Hour = 8;
        Minute = 45;
        Day = day + 1;
      }) 7;
    };
  };

  nixpkgs.config.allowUnfree = true;
}
