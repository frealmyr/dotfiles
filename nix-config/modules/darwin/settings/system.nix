{ ... }: {
  system = {
    activationScripts.postUserActivation.text = ''/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u''; # Activate most of the settings without restarting.

    startup.chime = false; # disables the woooaahhhmmm sound when powering on

    keyboard = {
      enableKeyMapping = true;
      # remapCapsLockToControl = true; # Non-VIM users things 
      remapCapsLockToEscape = true; # VIM users things
    };

    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        expose-animation-duration = 0.0;
        launchanim = false;
        mineffect = null;
        mru-spaces = false;
        orientation = "bottom";
        persistent-apps = null;
        persistent-others = null;
        show-process-indicators = false; # No need, as static-only is set.
        show-recents = false;
        static-only = true; # Only display apps that are currently running.
        tilesize = 48;
        wvous-tr-corner = 1; # Disable hot corners
        wvous-tl-corner = 1;
        wvous-br-corner = 1;
        wvous-bl-corner = 1;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = false;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = false;
      };

      menuExtraClock = {
        ShowDate = 0; # When space allows.
        ShowDayOfWeek = false;
      };

      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = false; # Use F1, F2, etc. keys as shortcuts.
        "com.apple.mouse.tapBehavior" = 1; # Enable tap-to-click for trackpad.
        "com.apple.sound.beep.feedback" = 0; # Disable feedback when changing volume.
        "com.apple.sound.beep.volume" = 0.0; # Disables beeps and boops sounds.
        "com.apple.springing.enabled" = true; # Hovering a folder on a folder to drop folder in a folder, dawg.
        "com.apple.springing.delay" = 0.0;
        "com.apple.trackpad.forceClick" = false;
        "com.apple.trackpad.scaling" = 1.50;
        AppleFontSmoothing = 1;
        AppleKeyboardUIMode = 3; # Enables keyboard control on macos prompts/windows.
        ApplePressAndHoldEnabled = false;
        AppleScrollerPagingBehavior = true; # Enable click to jump on scrollbars.
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleShowScrollBars = "Always";
        AppleSpacesSwitchOnActivate = false; # This works poorly with Yabai tiling when opening a new app instance.
        InitialKeyRepeat = 15;
        KeyRepeat = 3;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false; # Disable open/close animations for windows/popovers.
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSScrollAnimationEnabled = false;
        NSTableViewDefaultSizeMode = 1; # Small sidebar icons in finder.
        NSUseAnimatedFocusRing = false;
        NSWindowResizeTime = 0.0; # Speed of window resizing.
        NSWindowShouldDragOnGesture = true; # Enable moving windows by holding it anywhere like on Linux.
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };

      screencapture = {
        disable-shadow = true;
        location = "~/Desktop";
        show-thumbnail = false; # Disable popup in lower left corner after screencapture.
        type = "png";
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      trackpad = {
        Clicking = true; # enable tap to click
        ActuationStrength = 0; # less vibration pls
        FirstClickThreshold = 0; # 0 light, 1 medium, 2 firm.
        SecondClickThreshold = 0; # 0 light, 1 medium, 2 firm.
        TrackpadRightClick = true; # enable two finger right click
      };

      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };

      WindowManager = {
        EnableStandardClickToShowDesktop = false; # Disable dumb click on desktop to hide all windows gesture.
        StandardHideDesktopIcons = true; # Hide icons on desktop, so that I can clutter it as much as I want.
        EnableTiledWindowMargins = false; # Disable MacOS provided margins for screen edges, we can configure that ourselfs thank you.
      };

      CustomUserPreferences = {
        "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
        "com.apple.commerce".AutoUpdate = true; # Turn on app auto-update
        "com.apple.dashboard".mcx-disabled = true; # Disable MacOS dashboard in dock settings.
        "com.apple.ImageCapture".disableHotPlug = true; # Prevent photos app start when plugging in devices.
        "com.apple.mail".AddressesIncludeNameOnPasteboard = false; # copy addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>`
        "com.apple.print.PrintingPrefs"."Quit When Finished" = true;
        "com.apple.screencapture".target = "clipboard"; # Always default screencapture to clipboard on startup.
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
        "com.apple.universalaccess".increaseContrast = true;

        NSGlobalDomain = {
          NSAutomaticWindowAnimationsEnabled = false; # Disable open/close window/popover animations.
          "com.apple.sound.beep.flash" = 0; # Disable flashing screen when alert sound occurs.
          AppleMiniaturizeOnDoubleClick = false; # Disable double click window title to minimize.
          AppleReduceDesktopTinting = true; # Disable wallpaper tinting.
          AppleAccentColor = 5; # Purple color for accents in UI.
          AppleHighlightColor = "0.968627 0.831373 1.000000 Purple"; # Purple color for hightlights in UI.
          NSStatusItemSpacing = 6; # Menu bar padding between items.
        };

        "com.apple.finder" = {
          QuitMenuItem = true; # Enable quitting via ⌘ + q shortcut.
          NewWindowTarget = "PfDe";
          NewWindowTargetPath = "file://$''{HOME}/";
          DisableAllAnimations = true;
          ShowPathbar = true;
          howStatusBar = true;
          _FXShowPosixPathInTitle = true;
          _FXSortFoldersFirst = true;
          FXDefaultSearchScope = "SCcf"; # Search current folder by default.
          FXEnableExtensionChangeWarning = false;
          FXPreferredViewStyle = "Nlsv"; # List view as default.
          WarnOnEmptyTrash = false;
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
        };

        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true; # Disable .DS_Store for Network Shares.
          DSDontWriteUSBStores = true; # Disable .DS_Store for USB devices.
        };

        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          ScheduleFrequency = 1; # Check for software updates daily, not just once per week
          AutomaticDownload = 1; # Download newly available updates in background
          CriticalUpdateInstall = 1; # Install System data files & security updates
        };
      };
    };
  };
}
