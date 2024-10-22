# SIP (System Integrity Protection)

> System Integrity Protection ("rootless") is a security feature of macOS first introduced in 10.13, then further locked down in 10.14.

>System Integrity Protection protects some files and directories from being modified — even from the root user. yabai needs System Integrity Protection to be (partially) disabled so that it can inject a scripting addition into Dock.app, which owns the sole connection to the macOS window server. Many features of yabai require this scripting addition to be running such that yabai can modify windows, spaces and displays in a way that otherwise only Dock.app could.

# How does this affect me?

- Manually create workspaces
