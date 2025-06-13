{ ... }: {
  homebrew = {
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];

    casks = [
      "aerospace"
      "font-sf-pro"
    ];

    brews = [
      {
        name = "sketchybar";
        start_service = false;
      }
    ];
  };

  services.jankyborders = {
    enable = true;
    hidpi = true;
    # active_color = "0xffe1d8ef";
    inactive_color = "0x00000000";
    background_color = "0x00000000";
    width = 10.0;
  };
}
