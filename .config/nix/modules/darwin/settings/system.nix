{ ... }: {

  # # set max charge level to 80% using bclm
  # shellHook = ''
  #     bclm write 80 && bclm persist # TODO: https://github.com/zackelia/bclm/issues/49
  #   '';

  # system = {
  #   # keyboard.enableKeyMapping = true;
  #   # keyboard.remapCapsLockToEscape = true;

  #   activationScripts.postUserActivation.text = ''
  #     # Following line should allow us to avoid a logout/login cycle
  #     /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  #   '';

  #   keyboard = {
  #     enableKeyMapping = true;
  #     remapCapsLockToControl = true;
  #   };

  #   defaults = {
  #     NSGlobalDomain = {
  #       "com.apple.sound.beep.feedback" = 0;
  #       "com.apple.sound.beep.volume" = 0.0;
  #       AppleKeyboardUIMode = 3; # Enables keyboard control on macos prompts/windows

  #       AppleInterfaceStyle = null;
  #       AppleInterfaceStyleSwitchesAutomatically = true;
  #       ApplePressAndHoldEnabled = false;
  #       AppleShowAllExtensions = true;
  #       AppleShowAllFiles = true;
  #       AppleShowScrollBars = "Automatic";
  #       "com.apple.keyboard.fnState" = true; # Use FN mode for top row of built-in keyboard

  #       InitialKeyRepeat = 15;
  #       KeyRepeat = 2;

  #       NSAutomaticWindowAnimationsEnabled = false; # Disable open/close animations for windows/popovers

  #       NSAutomaticCapitalizationEnabled = false;
  #       NSAutomaticDashSubstitutionEnabled = false;
  #       NSAutomaticPeriodSubstitutionEnabled = false;
  #       NSAutomaticQuoteSubstitutionEnabled = false;
  #       NSAutomaticSpellingCorrectionEnabled = false;

  #       NSNavPanelExpandedStateForSaveMode = true;
  #       NSNavPanelExpandedStateForSaveMode2 = true;
  #     };

  #     loginwindow = {
  #       GuestEnabled = false;
  #       SHOWFULLNAME = false;
  #     };

  #     dock = {
  #       autohide = true;
  #       autohide-delay = 0.0;
  #       autohide-time-modifier = 0.2;
  #       expose-animation-duration = 0.2;
  #       mru-spaces = false;
  #       orientation = "bottom";
  #       persistent-apps = null;
  #       persistent-others = null;
  #       show-process-indicators = true;
  #       show-recents = false;
  #       tilesize = 48;
  #       # Disable hot corners
  #       wvous-tr-corner = 1;
  #       wvous-tl-corner = 1;
  #       wvous-br-corner = 1;
  #       wvous-bl-corner = 1;
  #     };

  #     finder = {
  #       _FXShowPosixPathInTitle = true;
  #       AppleShowAllExtensions = true;
  #       FXEnableExtensionChangeWarning = false;
  #       QuitMenuItem = true;
  #       ShowPathbar = true;
  #       ShowStatusBar = false;
  #     };

  #     trackpad = {
  #       Clicking = true; # enable tap to click
  #       TrackpadRightClick = true; # enable two finger right click
  #       TrackpadThreeFingerDrag = true;
  #     };

  #     universalaccess = {
  #       reduceMotion = true;
  #       reduceTransparency = true;
  #     };

  #     CustomUserPreferences = {
  #       "com.apple.universalaccess" = {
  #         increaseContrast = true; # TODO: Requires terminal full disk access
  #       };

  #       "com.apple.finder" = {
  #         ShowExternalHardDrivesOnDesktop = false;
  #         ShowHardDrivesOnDesktop = false;
  #         ShowMountedServersOnDesktop = false;
  #         ShowRemovableMediaOnDesktop = true;
  #         _FXSortFoldersFirst = true;
  #         # When performing a search, search the current folder by default
  #         FXDefaultSearchScope = "SCcf";
  #       };

  #       "com.apple.desktopservices" = {
  #         # Avoid creating .DS_Store files on network or USB volumes
  #         DSDontWriteNetworkStores = true;
  #         DSDontWriteUSBStores = true;
  #       };

  #       "com.apple.spaces" = {
  #         "spans-displays" = 1; # Display have seperate spaces
  #       };

  #       "com.apple.screensaver" = {
  #         # Require password immediately after sleep or screen saver begins
  #         askForPassword = 1;
  #         askForPasswordDelay = 0;
  #       };

  #       "com.apple.WindowManager" = {
  #         EnableStandardClickToShowDesktop = 0;
  #         StandardHideDesktopIcons = 1;
  #         HideDesktop = 1;
  #         StageManagerHideWidgets = 1;
  #         StandardHideWidgets = 1;
  #       };

  #       "com.apple.screencapture" = {
  #         location = "~/Downloads";
  #         type = "png";
  #       };

  #       "com.apple.AdLib" = {
  #         allowApplePersonalizedAdvertising = false;
  #       };

  #       "com.apple.ImageCapture".disableHotPlug = true; # Prevent Photos from opening automatically when devices are plugged in

  #       "com.apple.print.PrintingPrefs" = {
  #         "Quit When Finished" = true;
  #       };

  #       "com.apple.SoftwareUpdate" = {
  #         AutomaticCheckEnabled = true;
  #         ScheduleFrequency = 1; # Check for software updates daily, not just once per week
  #         AutomaticDownload = 1; # Download newly available updates in background
  #         CriticalUpdateInstall = 1; # Install System data files & security updates
  #       };

  #       "com.apple.commerce".AutoUpdate = true; # Turn on app auto-update

  #       "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;

  #       ".GlobalPreferences" = {
  #         "com.apple.sound.beep.sound" = "/System/Library/Sounds/Funk.aiff";
  #       };
  #     };
  #   };
  # };
}
