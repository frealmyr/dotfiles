{ ... }: {
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    global = {
      brewfile = true;
    };
    casks = [
      "betterdisplay"
      "firefox"
      "kitty"
      "visual-studio-code"
    ];
    taps = [
      "homebrew/services"
      "zackelia/formulae" # provides: bclm
    ];
    brews = [
      # {
      #   name = "bclm"; # https://github.com/zackelia/bclm/issues/49
      # }
      {
        name = "sleepwatcher";
        start_service = true;
      }
    ];
  };
}
