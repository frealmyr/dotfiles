{ ... }: {
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
    ];

    brews = [
      {
        name = "sleepwatcher";
        start_service = true;
      }
    ];

    casks = [
      "betterdisplay"
      "firefox"
      "visual-studio-code"
      "wezterm"
    ];
  };
}
