{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    blueutil
    cacert
    osx-cpu-temp
    pinentry_mac
  ];
}
