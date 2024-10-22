{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    skhd
    yabai
  ];

  launchd = {
    user = {
      agents = {
        yabai-indicator = {
          command = "/Applications/YabaiIndicator.app/Contents/MacOS/YabaiIndicator"; # TODO: Package this in nixpkgs, manual for now
          serviceConfig = {
            KeepAlive = true;
            RunAtLoad = true;
            StandardOutPath = "/tmp/yabai-indicator.out.log";
            StandardErrorPath = "/tmp/yabai-indicator.err.log";
          };
        };
      };
    };
  };

  services.skhd = {
    enable = true;
  };

  services.yabai = {
    enable = true;
  };
}
