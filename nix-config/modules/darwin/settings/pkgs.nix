{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cacert
    osx-cpu-temp
    pinentry_mac
  ];
}
