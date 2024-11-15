{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pinentry_mac
    osx-cpu-temp
  ];
}
