To find currently set plist entries:

```
❯ defaults read com.apple.CoreGraphics
{
    DisplayUseForcedGray = 0;
    DisplayUseInvertedPolarity = 0;
}

defaults read com.apple.universalaccess
{
    closeViewHotkeysEnabled = 0;
    closeViewZoomDisplayID = 0;
    closeViewZoomFactor = 1;
    increaseContrast = 0;
    login = 0;
    reduceMotion = 1;
    reduceTransparency = 1;
    sessionChange = 0;
}
```

To set a value:

```
sudo defaults write com.apple.universalaccess increaseContrast -bool yes
```
